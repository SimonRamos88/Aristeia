import 'package:aristeia_app/features/roadmap/domain/repositories/calcularPromedio.dart';
import 'package:aristeia_app/features/roadmap/domain/repositories/totalBloques.dart';
import 'package:auto_route/auto_route.dart';
import 'package:aristeia_app/core/widgets/roadmap_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget getRoadmapPublico() {
  return StreamBuilder<QuerySnapshot>(
    // Query solicitando los documentos
    stream: FirebaseFirestore.instance
        .collection('roadmap')
        .where("publico", isEqualTo: true)
        .snapshots(),
    builder: ((context, snapshot) {
      var doc = snapshot.data?.docs;
      if (snapshot.hasData) {
        return ListView.builder(
            itemCount: doc?.length,
            itemBuilder: (context, index) {
              // Función para calcular el promedio
              return FutureBuilder<double>(
                future: calcularPromedio(doc?[index].id),
                builder: (context, snapshot) {
                  double promedio = snapshot.data ?? 0.0;
                  // Función para calcular el total de bloques que tiene el roadmap
                  return FutureBuilder<int>(
                    future: totalBloques(doc?[index].id),
                    builder: (context, snapshot) {
                      int cantidadBloques = snapshot.data ?? 0;
                      return RoadmapCard(
                          myRoadmap: false,
                          nombreRoadmap: doc?[index]['nombre'],
                          descripcionRoadmap: doc?[index]['descripcion'],
                          etiquetas: doc?[index]['etiquetas'],
                          cantidadBloques: cantidadBloques,
                          calificacion: promedio,
                          onTap: () => {
                                context.router.navigateNamed(
                                  ('/logged/comunidad/${doc?[index].id}'),
                                ),
                              });
                    },
                  );
                },
              );
            });
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    }),
  );
}
