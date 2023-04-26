import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



Future<void> updateBlock(String roadmapID, String blockID, String title, String description, int importance, DateTime startDate, DateTime endDate) async {
  // Instanciar la db
  FirebaseFirestore db = FirebaseFirestore.instance;
  // Acceder a la colección y al document
  await db.collection("roadmap").doc(roadmapID).collection('bloques').doc(blockID).update({
    "titulo":title, 
    "descripcion":description,
    "completado": false,  
    "importancia": importance, 
    "fechaInicio": startDate, 
    "fechaFin": endDate
  });
}