import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:flutter/material.dart';

Future<String> createArea(Map<String, dynamic> data) async {
  String respuesta = "";
  FirebaseFirestore db = FirebaseFirestore.instance;
  //instanciamos la db y buscamos la coleccion
  CollectionReference collectionReferenceArea = db.collection('area');
  //antes que nada, verificamos que la informacion esté correcta
  if (data.containsKey("nombre")) {
    //subimos los datos del evento
    collectionReferenceArea.add(data);
    respuesta = 'datos subidos con exito';
  } else {
    respuesta = 'datos insuficientes';
  }

  return respuesta;
}
