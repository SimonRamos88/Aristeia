import 'package:aristeia_app/core/network/create_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:flutter/material.dart';

Future<String> createUsuario(Map<String, dynamic> data) async {
  String respuesta = "";
  FirebaseFirestore db = FirebaseFirestore.instance;
  //instanciamos la db y buscamos la coleccion
  CollectionReference collectionReferenceUsuario = db.collection('usuarios');
  //antes que nada, verificamos que la informacion esté correcta
  if (data.containsKey("usertag") &&
      data.containsKey("clave") &&
      data.containsKey("email") &&
      data.containsKey("nombres")) {
    //subimos los datos del evento
    collectionReferenceUsuario.add(data);
    //creamos el auth
    CreacionAuth(data["email"], data["clave"]);
    respuesta = 'datos subidos con exito';
  } else {
    respuesta = 'datos insuficientes';
  }

  return respuesta;
}
