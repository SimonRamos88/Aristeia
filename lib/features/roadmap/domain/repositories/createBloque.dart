import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:flutter/material.dart';

Future<void> addBlock(String roadmapID, String title, String description,
    int importance, DateTime startDate, DateTime endDate) async {
  // Instanciar la db
  FirebaseFirestore db = FirebaseFirestore.instance;
  // Acceder a la colección y al documento
  await db.collection('roadmap').doc(roadmapID).collection('bloques').add({
    "titulo": title,
    "descripcion": description,
    "completado": false,
    "importancia": importance,
    "fechaInicio": startDate,
    "fechaFin": endDate
  });
  print('datos subidos');
}
