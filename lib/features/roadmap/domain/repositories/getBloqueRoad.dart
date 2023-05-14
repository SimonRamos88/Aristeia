import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/widgets/alert_dialog_widget.dart';
import 'package:aristeia_app/core/widgets/block_card.dart';
import 'package:aristeia_app/features/roadmap/domain/repositories/deleteBloque.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<int> totalRecursos(String? roadmapID, String? bloqueID) async {
  final querySnapshot = await FirebaseFirestore.instance
      .collection('roadmap')
      .doc(roadmapID)
      .collection('bloques')
      .doc(bloqueID)
      .collection('recursos')
      .get();
  final size = querySnapshot.size;
  return size;
}

class BloqueRoad extends StatelessWidget {
  final String roadmapId;
  final bool edit;
  final bool nav;
  final bool isMyRoad;

  const BloqueRoad({
    Key? key,
    this.roadmapId = '1',
    this.edit = false,
    this.nav = false,
    this.isMyRoad = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      // Reemplazar 1 con el id del roadmap
      stream: FirebaseFirestore.instance
          .collection('roadmap')
          .doc(roadmapId)
          .collection('bloques')
          .snapshots(),
      builder: ((context, snapshot) {
        var doc = snapshot.data?.docs;
        if (snapshot.hasData) {
          return Expanded(
              child: ListView.builder(
            itemCount: doc?.length,
            itemBuilder: (context, index) {
              return FutureBuilder<int>(
                // Reemplazar 1 con el id del roadmap
                future: totalRecursos(roadmapId, doc?[index].id),
                builder: (context, snapshot) {
                  int cantidadRecursos = snapshot.data ?? 0;
                  DateTime dateFechaInicio =
                      doc?[index]['fechaInicio'].toDate();
                  DateTime dateFechaFin = doc?[index]['fechaFin'].toDate();
                  return BlockCard(
<<<<<<< HEAD
                    myRoadmap: isMyRoad,
                    edit: edit,
                    nombreBloque: doc?[index]['titulo'],
                    descripcion: doc?[index]['descripcion'],
                    fechaInicio: '${dateFechaInicio.year}-${dateFechaInicio.month}-${dateFechaInicio.day} ${dateFechaInicio.hour}:${dateFechaInicio.minute}:${dateFechaInicio.second}',
                    fechaFin: '${dateFechaFin.year}-${dateFechaFin.month}-${dateFechaFin.day} ${dateFechaFin.hour}:${dateFechaFin.minute}:${dateFechaFin.second}',
                    cantidadRecursos: cantidadRecursos,
                    blockId: doc?[index].id,
                    roadId: roadmapId,
                    onTap: nav
                      ? () => context.router.navigate(SingleBlockRoute(
                            roadId: int.parse(roadmapId),
                            blockId: int.parse(doc![index].id),
                          ))
                      : () => context.router.navigate(CreateResourceRoute(
                            roadId: int.parse(roadmapId),
                            blockId: int.parse(doc![index].id),
                          ))
                    );
=======
                      myRoadmap: isMyRoad,
                      edit: edit,
                      nombreBloque: doc?[index]['titulo'],
                      descripcion: doc?[index]['descripcion'],
                      fechaInicio:
                          '${dateFechaInicio.year}-${dateFechaInicio.month}-${dateFechaInicio.day} ${dateFechaInicio.hour}:${dateFechaInicio.minute}:${dateFechaInicio.second}',
                      fechaFin:
                          '${dateFechaFin.year}-${dateFechaFin.month}-${dateFechaFin.day} ${dateFechaFin.hour}:${dateFechaFin.minute}:${dateFechaFin.second}',
                      cantidadRecursos: cantidadRecursos,
                      blockId: doc?[index].id,
                      roadId: roadmapId,
                      onTap: nav
                          ? () => context.router.navigate(SingleBlockRoute(
                                roadId: int.parse(roadmapId),
                                blockId: int.parse(doc![index].id),
                                isMyRoadmap: isMyRoad,
                              ))
                          : () => context.router.navigate(CreateResourceRoute(
                                roadId: int.parse(roadmapId),
                                blockId: int.parse(doc![index].id),
                              )));
>>>>>>> 26b7a7340c76c85564e844f80d6af6b34872e84d
                },
              );
            },
          ));
        } else {
          return const Center(
            // Pantalla de carga
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}








// Widget getBloqueRoad(String roadmapID,) {
//   return StreamBuilder<QuerySnapshot>(
//     // Reemplazar 1 con el id del roadmap
//     stream: FirebaseFirestore.instance
//         .collection('roadmap')
//         .doc(roadmapID)
//         .collection('bloques')
//         .snapshots(),
//     builder: ((context, snapshot) {
//       var doc = snapshot.data?.docs;
//       if (snapshot.hasData) {
//         return Expanded(
//             child: ListView.builder(
//           itemCount: doc?.length,
//           itemBuilder: (context, index) {
//             return FutureBuilder<int>(
//               // Reemplazar 1 con el id del roadmap
//               future: totalRecursos(roadmapID, doc?[index].id),
//               builder: (context, snapshot) {
//                 int cantidadRecursos = snapshot.data ?? 0;
//                 return BlockCard(
//                   cantidadRecursos: cantidadRecursos,
//                   nombreBloque: doc?[index]['titulo'],
//                   onDelete: () async {
//                     await deleteBloque(
//                       // Cambiar 1 por el id del roadmap
//                       roadmapID,
//                       doc?[index].id,
//                     );
//                   },
//                   onTap: () => context.router.navigate(
//                       // BlockRouter()
//                       SingleBlockRoute(
//                     roadId: int.parse(roadmapID),
//                     blockId: int.parse(doc![index].id),
//                   )),
//                 );
//               },
//             );
//           },
//         ));
//       } else {
//         return const Center(
//           // Pantalla de carga
//           child: CircularProgressIndicator(),
//         );
//       }
//     }),
//   );
// }
