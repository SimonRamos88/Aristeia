import 'package:cloud_firestore/cloud_firestore.dart';

Future<int> getEstado(String? roadmapID) async {
  final querySnapshot =
  await FirebaseFirestore.instance.collection('roadmap').doc(roadmapID).collection('bloques').get();
  int bloquesCompletados = 0;

  // Contar los bloques completados
  querySnapshot.docs.forEach((doc) {
    if (doc['completado'] == true) bloquesCompletados++;
  });

  if (bloquesCompletados == querySnapshot.size){ // Roadmap terminado
    return 2;
  }else if (bloquesCompletados == 0){ // Roadmap sin iniciar
    return 0;
  }else{
    return 1; // Roadmap en progreso
  }
}