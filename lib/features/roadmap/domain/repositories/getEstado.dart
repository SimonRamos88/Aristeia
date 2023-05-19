import 'package:cloud_firestore/cloud_firestore.dart';

Future<int> getEstado(String? roadmapID) async {
  final querySnapshot =
  await FirebaseFirestore.instance.collection('roadmap').doc(roadmapID).collection('bloques').get();
  int bloquesTerminados = 0;
  int bloquesSinIniciar = 0;
  int n = 0;

  // Contar los estados en cada bloque
  querySnapshot.docs.forEach((doc) {
    n++;
    if (doc['estado'] == 0){
      bloquesSinIniciar++;
    }else if (doc['estado'] == 2){
      bloquesTerminados++;
    }
  });

  if (bloquesSinIniciar == n){ // Roadmap sin iniciar
    return 0;
  }else if (bloquesTerminados == n){ // Roadmap terminado
    return 2;
  }else{
    return 1; // Roadmap en progreso
  }
}