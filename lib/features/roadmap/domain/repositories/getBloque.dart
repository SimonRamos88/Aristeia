import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/widgets/block_card.dart';
import 'package:aristeia_app/features/roadmap/domain/repositories/deleteBloque.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<int> totalRecursos(String? roadmapID, String? bloqueID) async {
  final querySnapshot = await FirebaseFirestore.instance.collection('roadmap').doc(roadmapID).collection('bloques').doc(bloqueID).collection('recursos').get();
  final size = querySnapshot.size;
  return size;
}

Future<Map<String, dynamic>> getBlockId(String idRoad, String idBlock) async {
  Map<String, dynamic> respuesta = {};
  FirebaseFirestore db = FirebaseFirestore.instance;
  //instanciamos la db y buscamos la coleccion
  CollectionReference collectionReferenceRoadmap = db.collection('roadmap').doc(idRoad).collection('bloques');
  //antes que nada, verificamos que la informacion esté correcta
  DocumentSnapshot query = await collectionReferenceRoadmap.doc(idBlock).get();

  if (query.exists) {
    respuesta = query.data() as Map<String, dynamic>;    
  }

  return respuesta;
}

Future<List> getBlocks(String idRoad) async {

  List list = [];
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference collectionReferenceRoadmap = db.collection('roadmap').doc(idRoad).collection('bloques');

  QuerySnapshot query = await collectionReferenceRoadmap.get();

  query.docs.forEach( (doc) { 
    list.add(doc);
  });

  return list;

}