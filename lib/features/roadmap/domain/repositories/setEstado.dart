import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> setEstado(String? roadmapID) async {
  final querySnapshot = await FirebaseFirestore.instance
      .collection('roadmap')
      .doc(roadmapID)
      .collection('bloques')
      .get();
  int bloquesTerminados = 0;
  int bloquesSinIniciar = 0;

  // Contar los bloques completados
  querySnapshot.docs.forEach((doc) {
    if (doc['estado'] > 1) bloquesTerminados++;
    else if (doc['estado'] == 0) bloquesSinIniciar++;
  });

  if (bloquesTerminados == querySnapshot.size) {
    // Roadmap terminado
    FirebaseFirestore.instance
        .collection('roadmap')
        .doc(roadmapID)
        .update({'estado': 2});
  } else if (bloquesSinIniciar == querySnapshot.size) {
    // Roadmap sin iniciar
    FirebaseFirestore.instance
        .collection('roadmap')
        .doc(roadmapID)
        .update({'estado': 0});
  } else {
    // Roadmap en progreso
    FirebaseFirestore.instance
        .collection('roadmap')
        .doc(roadmapID)
        .update({'estado': 1}); 
  }
}
