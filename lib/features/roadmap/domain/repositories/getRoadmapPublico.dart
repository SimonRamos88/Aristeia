import 'package:auto_route/auto_route.dart';
import 'package:aristeia_app/core/widgets/roadmap_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<double> calcularPromedio(String? roadmapID) async {
  double sum = 0;
  int n = 0;
  // Instancia de autenticación para obtener el ID del usuario actual
  await FirebaseFirestore.instance.collection('roadmap').doc(roadmapID).collection('calificaciones').get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      sum += doc['calificacion'];
      n++;
    });
  });
  return n > 0 ? sum / n : 0;
}

Future<int> totalBloques(String? roadmapID) async {
  final querySnapshot =
  await FirebaseFirestore.instance.collection('roadmap').doc(roadmapID).collection('bloques').get();
  final size = querySnapshot.size;
  return size;
}

Widget getRoadmapPublico() {
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance.collection('roadmap').snapshots(),
    builder: ((context, snapshot){
      var doc = snapshot.data?.docs;
      if (snapshot.hasData){
        return ListView.builder(
          itemCount: doc?.length,
          itemBuilder: (context, index){
            if (doc?[index]['publico'] == true){
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