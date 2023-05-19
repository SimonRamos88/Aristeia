import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> setEstado(String? roadmapID) async {
  final querySnapshot = await FirebaseFirestore.instance
      .collection('roadmap')
      .doc(roadmapID)
      .collection('bloques')
      .get();
  int bloquesCompletados = 0;

  // Contar los bloques completados
  querySnapshot.docs.forEach((doc) {
    if (doc['estado'] > 1) bloquesCompletados++;
  });

  if (bloquesCompletados == querySnapshot.size) {
    // Roadmap terminado
    FirebaseFirestore.instance
        .collection('roadmap')
        .doc(roadmapID)
        .update({'estado': 2});
  } else if (bloquesCompletados == 0) {
    // Roadmap sin iniciar
    FirebaseFirestore.instance
        .collection('roadmap')
        .doc(roadmapID)
        .update({'estado': 0});
  } else {
    FirebaseFirestore.instance
        .collection('roadmap')
        .doc(roadmapID)
        .update({'estado': 1}); // Roadmap en progreso
  }

  final query = await FirebaseFirestore.instance
      .collection('roadmap')
      .doc(roadmapID)
      .get();
  Map<String, dynamic> xd = query.data() as Map<String, dynamic>;
  log(xd['estado'].toString());
}
