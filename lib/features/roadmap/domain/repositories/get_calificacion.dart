import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:flutter/material.dart';

Future<Map<String, dynamic>> getCalificacion(
    String roadmapID, String usuarioId) async {
  // Instanciar la db
  Map<String, dynamic> calificacion = {};
  FirebaseFirestore db = FirebaseFirestore.instance;

  CollectionReference query =
      db.collection('roadmap').doc(roadmapID).collection('calificaciones');

  QuerySnapshot calificacionDocument =
      await query.where('autor', isEqualTo: usuarioId).get();

  if (calificacionDocument.docs.isNotEmpty) {
    calificacion = calificacionDocument.docs[0].data() as Map<String, dynamic>;
  }

  print('datos obtenidos');
  print(calificacion);
  return calificacion;
}
