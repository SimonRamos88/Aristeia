import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';


// Este metodo trae un roadmap en especifico (aquel que tenga el id que le pasemos)
// no trae las subcolecciones
Future<Map<String, dynamic>> getRoadbyId(String? idRoad) async {
  Map<String, dynamic> respuesta = {};
  FirebaseFirestore db = FirebaseFirestore.instance;
  //instanciamos la db y buscamos la coleccion
  CollectionReference collectionReferenceRoadmap = db.collection('roadmap');
  //antes que nada, verificamos que la informacion esté correcta
  DocumentSnapshot query = await collectionReferenceRoadmap.doc(idRoad).get();

  if (query.exists) {
    respuesta = query.data() as Map<String, dynamic>;    
  }

  return respuesta;
}

// Este metodo trae todos los roadmaps. AL traerlos no trae las subcolecciones
Future<List> getRoads() async {

  List list = [];
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference collectionReferenceRoadmap = db.collection('roadmap');

  QuerySnapshot query = await collectionReferenceRoadmap.get();

  query.docs.forEach( (doc) { 
    list.add(doc);
  });

  return list;

}
