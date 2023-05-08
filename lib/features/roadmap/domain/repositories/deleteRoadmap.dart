import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:flutter/material.dart';

Future<bool> deleteRoadbyId(String idroad) async {
  bool respuesta = false;
  FirebaseFirestore db = FirebaseFirestore.instance;
  //instanciamos la db y buscamos la coleccion
  CollectionReference collectionReferenceArea = db.collection('roadmap');
  //antes que nada, verificamos que la informacion esté correcta
  DocumentSnapshot query = await collectionReferenceArea.doc(idroad).get();
  if (query.exists) {
    //borramos las subcolecciones
    QuerySnapshot bloques = await collectionReferenceArea
        .doc(idroad)
        .collection('bloques')
        .get() as QuerySnapshot<Object?>;
    for (var bloque in bloques.docs) {
      collectionReferenceArea
          .doc(idroad)
          .collection('bloques')
          .doc(bloque.id)
          .delete();
    }
    QuerySnapshot recursos = await collectionReferenceArea
        .doc(idroad)
        .collection('recursos')
        .get() as QuerySnapshot<Object?>;
    for (var recurso in recursos.docs) {
      collectionReferenceArea
          .doc(idroad)
          .collection('recursos')
          .doc(recurso.id)
          .delete();
    }
    //borramos finalmente el roadmap
    await collectionReferenceArea.doc(idroad).delete();
    respuesta = true;
  }
  return respuesta;
}
