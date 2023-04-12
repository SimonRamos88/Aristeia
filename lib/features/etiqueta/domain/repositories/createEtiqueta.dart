import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:flutter/material.dart';

Future<String> createEtiqueta(Map<String, dynamic> data) async {
  String respuesta = "";
  FirebaseFirestore db = FirebaseFirestore.instance;
  //instanciamos la db y buscamos la coleccion
  CollectionReference collectionReferenceEtiqueta = db.collection('etiquetas');
  //antes que nada, verificamos que la informacion esté correcta
  if (data.containsKey("nombre")) {
    //subimos los datos del evento
    collectionReferenceEtiqueta.add(data);
    respuesta = 'datos subidos con exito';
  } else {
    respuesta = 'datos insuficientes';
  }

  return respuesta;
}
