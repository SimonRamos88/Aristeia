import 'package:aristeia_app/core/network/auth.dart';
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
  CollectionReference collectionReferenceRoadmap = db.collection('roadmap');
  //traemos todos los datos
  var queryRoadmaps = await collectionReferenceRoadmap.where("creador",isEqualTo: idUser).get() ;
  DocumentSnapshot query = await collectionReferenceUsuario.doc(idUser).get();
  Map<String, dynamic> datos = query.data() as Map<String, dynamic>;
  print(datos);
  queryRoadmaps.docs.forEach((element) {
    element.reference.delete();

  });
  await collectionReferenceUsuario.doc(idUser).delete();
  print('usuario borrado1');
  await Auth().currentUser?.delete();
  print('usuario borrado');
  respuesta = true;

  return respuesta;
}
