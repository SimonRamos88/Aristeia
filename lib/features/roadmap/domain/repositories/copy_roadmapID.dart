import 'package:aristeia_app/features/roadmap/domain/repositories/create_bloque.dart';
import 'package:aristeia_app/features/roadmap/domain/repositories/getBloque.dart';
import 'package:aristeia_app/features/roadmap/domain/repositories/get_roadmap.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:flutter/material.dart';

Future<bool> copyRoadmapID(String idRoad, String idUser) async {
  bool respuesta = false;
  FirebaseFirestore db = FirebaseFirestore.instance;
  //traemos el roadmap primero y cambiamos su autor
  Map<String, dynamic> roadmapCopia = await getRoadbyId(idRoad);
  roadmapCopia["creador"] = idUser;
  roadmapCopia["nombre"] = roadmapCopia["nombre"] + "- Copia";
  roadmapCopia["publico"] = false;
  //luego traemos los bloques
  List bloques = await getBlocks(idRoad);

  //añadimos el nuevo roadmap
  await db.collection('roadmap').doc(idRoad + "2").set(roadmapCopia);
  print('copia creada');

  for (var b in bloques) {
    //print('tipo de bloque ' + b.id.runtimeType.toString());
    //aqui agregamos todos los bloques sin sus recursos al nuevo roadmap
    Map<String, dynamic> bloque = b.data();
    String idBloque = b.id;

    await addBlock(
        idRoad + "2",
        bloque['titulo'],
        bloque['descripcion'],
        bloque['importancia'],
        bloque['fechaInicio'].toDate(),
        bloque['fechaFin'].toDate());

    print("id: " + idBloque + " bloque: " + bloque.toString());
  }
  //finalmente añadimos la referencia del bloque copiado al usuario
  await db
      .collection('usuarios')
      .doc(idUser)
      .collection('roadMapCopiados')
      .add({"id_roadmap": "roadmap/" + idRoad});
  respuesta = true;

  return respuesta;
}
