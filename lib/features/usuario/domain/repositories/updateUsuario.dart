import 'package:aristeia_app/core/network/create_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:flutter/material.dart';

Future<void> getUsuariobyId(String idUser, Map<String, dynamic> data) async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  //instanciamos la db y buscamos la coleccion
  CollectionReference collectionReferenceUsuario = db.collection('usuarios');
  //traemos todos los datos
  DocumentSnapshot query = await collectionReferenceUsuario.doc(idUser).get();
  if (query.exists) {
    await collectionReferenceUsuario.doc(idUser).update(data);
  }
}
