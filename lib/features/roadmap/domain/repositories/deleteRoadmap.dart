import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import '../../../estadistica/domain/usecases/roadmapsAsociadosAEtiqueta.dart';

Future<bool> deleteRoadbyId(String idroad) async {
  bool respuesta = false;
  FirebaseFirestore db = FirebaseFirestore.instance;
  //instanciamos la db y buscamos la coleccion
  CollectionReference collectionReferenceArea = db.collection('roadmap');
  //antes que nada, verificamos que la informacion esté correcta
  DocumentSnapshot query = await collectionReferenceArea.doc(idroad).get();
  if (query.exists) {
    // Obtenemos la lista de etiquetas del roadmap
    List<String> etiquetas = List<String>.from(query['etiquetas']);
    if (query['publico']) {
      // Convertimos los nombres de las etiquetas en sus IDs correspondientes
      List<String> etiquetaIds = [];
      QuerySnapshot etiquetasSnapshot =
          await FirebaseFirestore.instance.collection('etiquetas').get();
      for (DocumentSnapshot doc in etiquetasSnapshot.docs) {
        if (etiquetas.contains(doc['nombre'])) {
          etiquetaIds.add(doc.id);
        }
      }
      await decrementarNumeroRoadmapsAsociados(etiquetaIds);
    }

    await collectionReferenceArea.doc(idroad).delete();
    respuesta = true;
  }
  return respuesta;
}
