import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:flutter/material.dart';

Future<Map<String, dynamic>> getRecurso(
    String roadmapID, String bloqueID, String idRecurso) async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  //instanciamos la db y buscamos la coleccion
  CollectionReference collectionReferenceRecurso = db.collection('roadmap');

  //antes que nada, verificamos que la informacion esté correcta
  DocumentSnapshot query = await collectionReferenceRecurso
      .doc(roadmapID)
      .collection('bloques')
      .doc(bloqueID)
      .collection('recursos')
      .doc(idRecurso)
      .get();

  if (query.exists) {
    return query.data() as Map<String, dynamic>;
  }

  return {};
}
