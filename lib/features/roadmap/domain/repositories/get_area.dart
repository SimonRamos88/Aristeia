import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:flutter/material.dart';

Future<List> getArea() async {
  List respuesta = [];
  FirebaseFirestore db = FirebaseFirestore.instance;
  //instanciamos la db y buscamos la coleccion
  CollectionReference collectionReferenceArea = db.collection('area');

  //antes que nada, verificamos que la informacion esté correcta
  QuerySnapshot query = await collectionReferenceArea.get();

  for (var a in query.docs) {
    Map<String, dynamic> datosTraidos = a.data() as Map<String, dynamic>;
    QuerySnapshot subquery =
        await db.collection('area').doc(a.id).collection('subtemas').get();
    List subtemas = [];
    for (var b in subquery.docs) {
      subtemas.add(b.data());
    }
    datosTraidos['subtemas'] = subtemas;
    respuesta.add(datosTraidos);
  }

  return respuesta;
}

/*Probar en welcome_screen */
/*
   floatingActionButton: IconButton(
        icon: Icon(
          Icons.help,
          size: 30.0,
        ),
        onPressed: () async {
          List datos = await getArea();
          print(datos);
        },
      ),

 */