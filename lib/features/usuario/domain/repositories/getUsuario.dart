import 'package:aristeia_app/core/network/auth.dart';
import 'package:aristeia_app/core/network/create_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:flutter/material.dart';

Future<List> getUsuario() async {
  List respuesta = [];
  FirebaseFirestore db = FirebaseFirestore.instance;
  //instanciamos la db y buscamos la coleccion
  CollectionReference collectionReferenceUsuario = db.collection('usuarios');
  //traemos todos los datos
  QuerySnapshot query = await collectionReferenceUsuario.get();
  for (var u in query.docs) {
    respuesta.add(u.data());
  }
  return respuesta;
}
