import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:flutter/material.dart';

Future<String> updateTema(
    Map<String, dynamic> data, String idArea, String idTema) async {
  String respuesta = "";
  FirebaseFirestore db = FirebaseFirestore.instance;
  //instanciamos la db y buscamos la coleccion
  CollectionReference collectionReferenceArea = db.collection('area');
  //antes que nada, verificamos que la informacion esté correcta
  if (data.containsKey("nombre")) {
    //subimos los datos del evento
    collectionReferenceArea
        .doc(idArea)
        .collection('subtemas')
        .doc(idTema)
        .update(data);
    respuesta = 'datos actualizados con exito';
  } else {
    respuesta = 'datos insuficientes';
  }

  return respuesta;
}
