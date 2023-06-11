import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/widgets/block_card.dart';
import 'package:aristeia_app/features/roadmap/domain/repositories/delete_bloque.dart';
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
  return querySnapshot.size;
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

  bool fechaLimite(DateTime fechaInicio, DateTime fechaFin, int estadoBloque){
    if (fechaInicio != null &&
      fechaInicio.compareTo(DateTime.now()) < 0 &&
      estadoBloque == 0){
      return true;
    }else if ((fechaFin != null &&
      fechaFin.compareTo(DateTime.now()) < 0 &&
      estadoBloque < 2)){
      return true;
    }else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
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
                      myRoadmap: isMyRoad,
                      edit: edit,
                      estado: isMyRoad? (doc?[index]['estado']) : 0,
                      nombreBloque: doc?[index]['titulo'],
                      descripcion: doc?[index]['descripcion'],
                      fechaInicio:
                          '${dateFechaInicio.year}-${dateFechaInicio.month}-${dateFechaInicio.day}',
                      fechaFin:
                          '${dateFechaFin.year}-${dateFechaFin.month}-${dateFechaFin.day}',
                      cantidadRecursos: cantidadRecursos,
                      blockId: doc?[index].id,
                      roadId: roadmapId,
                      fechaLimite: fechaLimite(dateFechaInicio, dateFechaFin, doc?[index]['estado']),
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