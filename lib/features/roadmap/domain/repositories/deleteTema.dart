import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:flutter/material.dart';

Future<void> deleteTema(String idArea, String idTema) async {
  String respuesta = "";
  FirebaseFirestore db = FirebaseFirestore.instance;
  //instanciamos la db y buscamos la coleccion
  CollectionReference collectionReferenceArea = db.collection('area');
  DocumentSnapshot tema = collectionReferenceArea
      .doc(idArea)
      .collection('subtemas')
      .doc(idTema)
      .get() as DocumentSnapshot<Object?>;
  //antes que nada, verificamos que la informacion esté correcta
  if (tema.exists) {
    //subimos los datos del evento
    collectionReferenceArea
        .doc(idArea)
        .collection('subtemas')
        .doc(idTema)
        .delete();
    respuesta = 'datos borrados con exito';
  } else {
    respuesta = 'datos no existentes';
  }
}
