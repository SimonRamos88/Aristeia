import 'package:aristeia_app/core/network/auth.dart';
import 'package:aristeia_app/core/network/create_auth.dart';
import 'package:aristeia_app/core/network/delete_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:aristeia_app/features/roadmap/domain/repositories/delete_roadmap.dart';

Future<bool> deleteUsuariobyId(String idUser) async {
  bool respuesta = false;
  //instanciamos la db y buscamos la coleccion
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference collectionReferenceUsuario = db.collection('usuarios');
  CollectionReference collectionReferenceRoadmap = db.collection('roadmap');

  //Traemos los roadmaps y los borramos
  var queryRoadmaps = await collectionReferenceRoadmap.where("creador",isEqualTo: idUser).get() ;
  DocumentSnapshot query = await collectionReferenceUsuario.doc(idUser).get();
  Map<String, dynamic> datos = query.data() as Map<String, dynamic>;
  queryRoadmaps.docs.forEach((element)  {
     deleteRoadbyId(element.reference.id);
  });
  print('primera prueba');

  QuerySnapshot roadMapsCopiados = await collectionReferenceUsuario
        .doc(idUser)
        .collection('roadMapsCopiados')
        .get() as QuerySnapshot<Object?>;

  roadMapsCopiados.docs.forEach((element) {
    element.reference.delete();
  });

  print('segunda prueba');
  QuerySnapshot roadMapsCreados = await collectionReferenceUsuario
        .doc(idUser)
        .collection('roadMapsCreados')
        .get() as QuerySnapshot<Object?>;

  roadMapsCreados.docs.forEach((element) {
    element.reference.delete();
  });

  print('tercera prueba');
  QuerySnapshot usoAplicacion = await collectionReferenceUsuario
        .doc(idUser)
        .collection('usoAplicacion')
        .get() as QuerySnapshot<Object?>;

  usoAplicacion.docs.forEach((element) {
    element.reference.delete();
  });

  await collectionReferenceUsuario.doc(idUser).delete();

  print('Cuarta prueba');


  respuesta = true;

  return respuesta;
}
