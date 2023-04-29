import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:flutter/material.dart';

Future<String> createRecurso(
    Map<String, dynamic> data, String roadmapID, String bloqueID) async {
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
    await collectionReferenceRecurso.add(data);
    res = 'datos subidos con exito';
  } else {
    res = 'datos insuficientes';
  }

  return res;
}
