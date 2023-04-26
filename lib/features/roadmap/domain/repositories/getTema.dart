import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:flutter/material.dart';

Future<List> getTema(String idArea) async {
  List respuesta = [];
  FirebaseFirestore db = FirebaseFirestore.instance;
  //instanciamos la db y buscamos la coleccion
  CollectionReference collectionReferenceArea = db.collection('area');
  //antes que nada, verificamos que la informacion esté correcta
  QuerySnapshot query =
      await collectionReferenceArea.doc(idArea).collection('subtemas').get();

  for (var a in query.docs) {
    respuesta.add(a.data());
  }

  return respuesta;
}
