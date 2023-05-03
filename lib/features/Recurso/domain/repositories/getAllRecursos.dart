import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:flutter/material.dart';

Future<List> getRecursos(String roadmapID, String bloqueID) async {
  List resources = [];

  FirebaseFirestore db = FirebaseFirestore.instance;
  //instanciamos la db y buscamos la coleccion
  CollectionReference collectionReferenceRecurso = db.collection('roadmap');

  //antes que nada, verificamos que la informacion esté correcta
  QuerySnapshot query = await collectionReferenceRecurso
      .doc(roadmapID)
      .collection('bloques')
      .doc(bloqueID)
      .collection('recursos')
      .get();

  query.docs.forEach((doc) {
    resources.add(doc);
  });

  return resources;
}
