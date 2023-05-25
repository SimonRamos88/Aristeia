import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:flutter/material.dart';

Future<bool> deleteBloque(String? roadmapID, String? blockID) async {
  bool respuesta = false;
  // Instanciamos la db y buscamos la coleccion
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference collectionReferenceArea = db.collection('roadmap').doc(roadmapID).collection('bloques');
  DocumentSnapshot query = await collectionReferenceArea.doc(blockID).get();
  if (query.exists) {
    // Borramos los documentos de la subcoleccion de recursos
    QuerySnapshot recursos = await collectionReferenceArea
          .doc(blockID)
          .collection('recursos')
          .get();
      for (var recurso in recursos.docs) {
        collectionReferenceArea
            .doc(blockID)
            .collection('recursos')
            .doc(recurso.id)
            .delete();
      }

    // Borramos finalmente el bloque
    await collectionReferenceArea.doc(blockID).delete();
    respuesta = true;
  }
  return respuesta;
}