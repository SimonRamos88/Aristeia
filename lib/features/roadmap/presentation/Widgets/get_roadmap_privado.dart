
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/roadmap_card.dart';
import 'package:aristeia_app/features/roadmap/domain/repositories/calcular_promedio.dart';
import 'package:aristeia_app/features/roadmap/domain/repositories/getEstado.dart';
import 'package:aristeia_app/features/roadmap/domain/repositories/total_bloques.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../core/network/auth.dart';
import '../../domain/entities/show_road.dart';


class GetRoadmapPrivado extends showRoad{
  @override
  Widget getRoadmap(String filter) {
  return StreamBuilder<QuerySnapshot>(
    // Query solicitando los documentos
    stream: 
         FirebaseFirestore.instance
            .collection('roadmap')
            .where("creador", isEqualTo: Auth().currentUser!.uid)
            .snapshots(),
        
    builder: ((context, snapshot) {
      var doc = snapshot.data?.docs.where((element) {
        return element['nombre'].toString().toLowerCase().contains(filter.toLowerCase());
      }).toList();
      if (snapshot.hasData) {
        if (doc!.isNotEmpty) {
          return ListView.builder(
            itemCount: doc?.length,
            itemBuilder: (context, index) {
              // Función para calcular el promedio
              return FutureBuilder<double>(
                future: calcularPromedio(doc?[index].id),
                builder: (context, snapshot) {
                  var key = doc[index].data();
                  roads.add( key as Map);
                  double promedio = snapshot.data ?? 0.0;
                  // Función para calcular el total de bloques que tiene el roadmap
                  return FutureBuilder<int>(
                    future: totalBloques(doc?[index].id),
                    builder: (context, snapshot) {
                      int cantidadBloques = snapshot.data ?? 0;
                      // Función para determinar el estado del roadmap
                      return FutureBuilder<int>(
                          future: getEstado(doc?[index].id),
                          builder: (context, snapshot) {
                            int estadoRoadmap = snapshot.data ?? 0;
                            return RoadmapCard(
                                myRoadmap: true,
                                nombreRoadmap: doc?[index]['nombre'],
                                descripcionRoadmap: doc?[index]['descripcion'],
                                estadoRoadmap: estadoRoadmap,
                                etiquetas: doc?[index]['etiquetas'],
                                cantidadBloques: cantidadBloques,
                                calificacion: promedio,
                                onTap: () => {
                                      context.router.navigateNamed(
                                        ('/logged/personal/${doc?[index].id}'),
                                      )
                                    });
                          });
                    },
                  );
                },
              );
            },
          );
        } else {
          if (filter == '') {
            return Padding(
                  padding: EdgeInsets.symmetric(vertical: 36, horizontal: 24),
                  child: Text(
                              'No cuentas con ningún roadmap privado en este momento',
                              style: heading3Style,
                              textAlign: TextAlign.center,
                            ),
                );
          } else {
            return  Padding(
                  padding: EdgeInsets.symmetric(vertical: 36, horizontal: 24),
                  child: Text(
                              'No se encontraron resultados',
                              style: heading3Style,
                              textAlign: TextAlign.center,
                            ),
                );
          }
        }
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    }),
  );
}
  
}


