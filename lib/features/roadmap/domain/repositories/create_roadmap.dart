import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:flutter/material.dart';

Future<String> createRoadmap(Map<String, dynamic> data) async {
  String respuesta = "algun error inesperado";
  FirebaseFirestore db = FirebaseFirestore.instance;
  //instanciamos la db y buscamos la coleccion
  CollectionReference collectionReferenceRoad = db.collection('roadmap');
  
  // controlamos que este toda la info necesaria en el mapa
  if(data.containsKey('creador') && data.containsKey('descripcion') && data.containsKey('etiquetas') 
    && data.containsKey('fechaInicio') && data.containsKey('nombre') && data.containsKey('publico') 
    && data.containsKey('ref_prueba') && data.containsKey('tema')){

      //subimos los datos del evento
      await collectionReferenceRoad.add(data);
      //var newRoad = await collectionReferenceRoad.add(data);
      /*print('working');
      print(newRoad.id);
      collectionReferenceRoad.doc(newRoad.id).collection('bloques').add({
        'campox' : 'prueba'
      });*/
      respuesta = 'datos subidos con exito';
  }
  
  return respuesta;
}

Map<String, dynamic> createMapToRoad({String? creador, String? descripcion, List? etiquetas, String? nombre, bool? publico, String? refPrueba, String? tema}) {

    var map = {'creador':creador, 
              'descripcion' : descripcion, 
              'etiquetas' : etiquetas,
              'fechaInicio' : DateTime.now(), 
              'nombre' : nombre, 
              'publico' : publico, 
              'ref_prueba' : refPrueba, 
              'tema' : tema
            };

    return map;
}