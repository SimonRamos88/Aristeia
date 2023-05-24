import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:flutter/material.dart';

Future<String> addCalificacion(String roadmapID, String usuarioId,
    double rating) async {
  // Instanciar la db
  FirebaseFirestore db = FirebaseFirestore.instance;

  CollectionReference query =
      db.collection('roadmap').doc(roadmapID).collection('calificaciones');

  var rng = Random();
  //String calificacionID = rng.nextInt(100000).toString();
  QuerySnapshot califSnapshot =
      await query.where('autor', isEqualTo: usuarioId).get();
  String calificacionID = '';
  if (califSnapshot.docs.isNotEmpty) {
    print('papi entro aca');
    calificacionID = califSnapshot.docs[0].id;
    await query.doc(calificacionID).update({
      'calificacion': rating // Actualiza el rating con el nuevo valor
    });
  } else {
    print('papi callate entro aca');
    calificacionID = rng.nextInt(100000).toString();
    await query
      ..doc(calificacionID).set({
        "autor": usuarioId,
        "calificacion": rating
      });
  }
  print(califSnapshot);
  print('datos subidos');
  return usuarioId;
}
