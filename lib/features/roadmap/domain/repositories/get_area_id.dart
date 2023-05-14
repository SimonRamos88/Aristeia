import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:flutter/material.dart';

Future<Map<String, dynamic>> getAreabyId(String idArea) async {
  Map<String, dynamic> respuesta = {};
  FirebaseFirestore db = FirebaseFirestore.instance;
  //instanciamos la db y buscamos la coleccion
  CollectionReference collectionReferenceArea = db.collection('area');
  //antes que nada, verificamos que la informacion esté correcta
  DocumentSnapshot query = await collectionReferenceArea.doc(idArea).get();
  if (query.exists) {
    respuesta = query.data() as Map<String, dynamic>;
  }

  return respuesta;
}
