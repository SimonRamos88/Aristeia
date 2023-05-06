import 'package:aristeia_app/core/widgets/roadmap_card.dart';
import 'package:aristeia_app/features/roadmap/domain/repositories/calcularPromedio.dart';
import 'package:aristeia_app/features/roadmap/domain/repositories/totalBloques.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Widget getRoadmapPrivado() {
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance.collection('roadmap').snapshots(),
    builder: ((context, snapshot){
      var doc = snapshot.data?.docs;
      if (snapshot.hasData){
        return ListView.builder(
          itemCount: doc?.length,
          itemBuilder: (context, index){
            if (doc?[index]['creador'] == uid){
              return FutureBuilder<double>(
                future: calcularPromedio(doc?[index].id),
                builder: (context, snapshot) {
                  double promedio = snapshot.data ?? 0.0;
                  return FutureBuilder<int>(
                    future: totalBloques(doc?[index].id),
                    builder: (context, snapshot) {
                      int cantidadBloques = snapshot.data ?? 0;
                      return RoadmapCard(
                        myRoadmap: false,
                        nombreRoadmap: doc?[index]['nombre'],
                        descripcionRoadmap: doc?[index]['descripcion'],
                        estadoRoadmap: doc?[index]['publico'] == true ? 0 : 1,
                        etiquetas: doc?[index]['etiquetas'],
                        cantidadBloques: cantidadBloques,
                        calificacion: promedio,
                        onTap: () => {context.router.navigateNamed(
                          ('/logged/comunidad/${index+1}'),
                        ),}
                      );
                    },
                  );
                },
              );
            }
          },
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    }),
  );
}