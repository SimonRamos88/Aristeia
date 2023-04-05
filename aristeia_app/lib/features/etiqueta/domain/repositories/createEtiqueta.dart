import 'dart:math';

import 'package:flutter/material.dart';

Future<String> createEvent(Map<String, dynamic> data) async {
  String respuesta = "";
  var rng = Random();
  String idEvento = rng.nextInt(1000).toString();
  FirebaseFirestore db = FirebaseFirestore.instance;
  //instanciamos la db y buscamos la coleccion
  CollectionReference collectionReferenceEvento = db.collection('Evento');
  //antes que nada, verificamos que la informacion esté correcta
  if (data.containsKey("creador") &&
      data.containsKey("titulo") &&
      data.containsKey("lugar") &&
      data.containsKey("link_img")) {
    //subimos los datos del evento
    collectionReferenceEvento.doc(idEvento).set(data);
    respuesta = 'datos subidos con id $idEvento';
  } else {
    respuesta = 'datos insuficientes';
  }
  /*
  Widget completado(BuildContext context) {
    return AlertDialog(
        title: const Text('Notificacion Evento'),
        content: Text(
          respuesta,
          style: TextStyle(fontSize: 20),
        ));
  }
  */
  return respuesta;
}
