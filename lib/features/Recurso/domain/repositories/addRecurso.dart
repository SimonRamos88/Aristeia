import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:flutter/material.dart';

Future<String> createRecurso(
    Map<String, dynamic> data, String roadmapID, String bloqueID, String recursoID) async {
  String res = "";
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference collectionReferenceRecurso = db
      .collection('roadmap')
      .doc(roadmapID)
      .collection('bloques')
      .doc(bloqueID)
      .collection('recursos');
  //antes que nada, verificamos que la informacion esté correcta
  if (data.containsKey("nombre") &&
      data.containsKey("descripcion") &&
      data.containsKey("links_relacionados") &&
      data.containsKey("autor") &&
      data.containsKey("imagen")) {
    //subimos los datos del evento
    await collectionReferenceRecurso.doc(recursoID).set(data);
    res = 'datos subidos con exito';
  } else {
    res = 'datos insuficientes';
  }

  return res;
}


Future<int> getRecursoAmount( String roadmapID, String bloqueID) async{

  int amount = -1;
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference collectionReferenceRecurso = db
      .collection('roadmap')
      .doc(roadmapID)
      .collection('bloques')
      .doc(bloqueID)
      .collection('recursos');
  
  QuerySnapshot query= await collectionReferenceRecurso.get();
  if(!query.docs.isEmpty){
    amount = query.size;
  }
  
  return amount;

}


List<String> StringToList (String input) {
  
  List<String> list = [];
  String cad = "";
  
  input.runes.forEach((e) {
    var ch = String.fromCharCode(e);
    if(ch!=" "){
        cad += ch;
    }else{
      if(cad != ""){
        list.add(cad);
        cad = "";
      }else{
        cad = "";
      }
    }
  });

  if(cad!=""){
    list.add(cad);
  }
  return list;
}