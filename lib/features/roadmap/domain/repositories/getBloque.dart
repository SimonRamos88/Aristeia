import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/widgets/block_card.dart';
import 'package:aristeia_app/features/roadmap/domain/repositories/deleteBloque.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<int> totalRecursos(String? roadmapID, String? bloqueID) async {
  final querySnapshot = await FirebaseFirestore.instance.collection('roadmap').doc(roadmapID).collection('bloques').doc(bloqueID).collection('recursos').get();
  final size = querySnapshot.size;
  return size;
}

Widget getBlock() {
  return StreamBuilder<QuerySnapshot>(
    // Reemplazar 1 con el id del roadmap
    stream: FirebaseFirestore.instance.collection('roadmap').doc('1').collection('bloques').snapshots(),
    builder: ((context, snapshot){
      var doc = snapshot.data?.docs;
      if (snapshot.hasData) {
        return Expanded(
          child:ListView.builder(
            itemCount: doc?.length,
            itemBuilder: (context, index){
              return FutureBuilder<int>(
                future: totalRecursos('1', doc?[index].id),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return BlockCard(
                      fechaFin: DateFormat('yyyy-MM-dd – kk:mm').format(doc?[index]['fechaFin'].toDate()),
                      fechaInicio: DateFormat('yyyy-MM-dd – kk:mm').format(doc?[index]['fechaInicio'].toDate()), 
                      nombreBloque: doc?[index]['titulo'],
                      onDelete:  () async {
                        await deleteBloque(
                            // Cambiar 1 por el id del roadmap
                            '1',
                            doc?[index].id,
                          );
                      },
                      cantidadRecursos: snapshot.data!,
                      onTap: () => context.router.navigate(
                        // BlockRouter()
                        SingleBlockRoute(blockId: index),
                      ),
                    );
                  } else {
                    return BlockCard(
                      nombreBloque: doc?[index]['titulo'],
                      cantidadRecursos: 0,
                      onTap: () => context.router.navigate(
                        // BlockRouter()
                        SingleBlockRoute(blockId: index),
                      ),
                    );
                  }
                },
              );
            },
          )
        );
      } else {
        return const Center(
          // Pantalla de carga
          child: CircularProgressIndicator(),
        );
      }
    }),
  );
}