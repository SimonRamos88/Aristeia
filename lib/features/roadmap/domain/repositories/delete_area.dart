import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:flutter/material.dart';

Future<bool> deleteAreabyId(String idArea) async {
  bool respuesta = false;
  FirebaseFirestore db = FirebaseFirestore.instance;
  //instanciamos la db y buscamos la coleccion
  CollectionReference collectionReferenceArea = db.collection('area');
  //antes que nada, verificamos que la informacion esté correcta
  DocumentSnapshot query = await collectionReferenceArea.doc(idArea).get();
  if (query.exists) {
    await collectionReferenceArea.doc(idArea).delete();
    respuesta = true;
  }
  return respuesta;
}
