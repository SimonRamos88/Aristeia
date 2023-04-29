import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:flutter/material.dart';

Future<void> updateRoadbyId(String idRoad, Map<String, dynamic> data) async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  //instanciamos la db y buscamos la coleccion
  CollectionReference collectionReferenceRoad = db.collection('roadmap');
  //antes que nada, verificamos que la informacion esté correcta
  DocumentSnapshot query = await collectionReferenceRoad.doc(idRoad).get();
  if (query.exists) {
    await collectionReferenceRoad.doc(idRoad).update(data);
  }
}