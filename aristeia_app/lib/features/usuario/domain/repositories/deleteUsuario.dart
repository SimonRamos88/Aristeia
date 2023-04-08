import 'package:aristeia_app/core/network/create_auth.dart';
import 'package:aristeia_app/core/network/delete_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:flutter/material.dart';

Future<bool> deleteUsuariobyId(String idUser) async {
  bool respuesta = false;
  FirebaseFirestore db = FirebaseFirestore.instance;
  //instanciamos la db y buscamos la coleccion
  CollectionReference collectionReferenceUsuario = db.collection('usuarios');
  //traemos todos los datos
  DocumentSnapshot query = await collectionReferenceUsuario.doc(idUser).get();
  Map<String, dynamic> datos = query.data() as Map<String, dynamic>;
  print(datos);
  await collectionReferenceUsuario.doc(idUser).delete();
  await delete_Auth(datos['email'], datos['clave']);
  print('usuario borrado');
  respuesta = true;

  return respuesta;
}
