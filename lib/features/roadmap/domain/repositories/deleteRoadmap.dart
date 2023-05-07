import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:flutter/material.dart';

Future<bool> deleteRoadbyId(String idroad) async {
  bool respuesta = false;
  FirebaseFirestore db = FirebaseFirestore.instance;
  //instanciamos la db y buscamos la coleccion
  CollectionReference collectionReferenceArea = db.collection('roadmap');
  //antes que nada, verificamos que la informacion esté correcta
  DocumentSnapshot query = await collectionReferenceArea.doc(idroad).get();
  if (query.exists) {
    await collectionReferenceArea.doc(idroad).delete();
    respuesta = true;
  }
  return respuesta;
}
