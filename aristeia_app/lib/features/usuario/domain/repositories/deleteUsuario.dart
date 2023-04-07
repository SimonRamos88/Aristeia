import 'package:aristeia_app/core/network/create_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:flutter/material.dart';

Future<bool> deleteUsuariobyId(String idUser) async {
  bool respuesta = false;
  FirebaseFirestore db = FirebaseFirestore.instance;
  //instanciamos la db y buscamos la coleccion
  CollectionReference collectionReferenceUsuario = db.collection('usuarios');
  //traemos todos los datos
  collectionReferenceUsuario.doc(idUser).delete();
  respuesta = true;

  return respuesta;
}
