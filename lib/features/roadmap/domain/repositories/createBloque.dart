import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:flutter/material.dart';

Future<String> addBlock(String roadmapID, String title, String description,
    int importance, DateTime startDate, DateTime endDate) async {
  // Instanciar la db
  FirebaseFirestore db = FirebaseFirestore.instance;
  var rng = Random();
  String bloqueId = rng.nextInt(100000).toString();
  // Acceder a la colección y al documento
  await db
      .collection('roadmap')
      .doc(roadmapID)
      .collection('bloques')
      .doc(bloqueId)
      .set({
    "titulo": title,
    "descripcion": description,
    "completado": false,
    "importancia": importance,
    "fechaInicio": startDate,
    "fechaFin": endDate,
    "estado": 0
  });
  print('datos subidos');
  return bloqueId;
}
