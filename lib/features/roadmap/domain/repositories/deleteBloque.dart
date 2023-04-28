import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:flutter/material.dart';

Future<void> deleteBloque(String? roadmapID, String? blockID) async {
  // Instanciar la db
  FirebaseFirestore db = FirebaseFirestore.instance;
  // Acceder a la colección y al documento
  await db.collection("roadmap").doc(roadmapID).collection('bloques').doc(blockID).delete();
}