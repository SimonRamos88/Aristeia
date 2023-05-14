import 'package:cloud_firestore/cloud_firestore.dart';

Future<int> getEstado(String? roadmapID) async {
  final querySnapshot =
  await FirebaseFirestore.instance.collection('roadmap').doc(roadmapID).collection('bloques').get();
  int bloquesCompletados = 0;
  int bloquesSinIniciar = 0;

  // Contar los bloques completados
  querySnapshot.docs.forEach((doc) {
    if (doc['estado'] > 1){
      bloquesCompletados++;
    }    else if (doc['estado'] == 0){
      bloquesSinIniciar++;
    }  
    }
  );

  if (bloquesCompletados == querySnapshot.size){ // Roadmap terminado
    return 2;
  }else if (bloquesSinIniciar == querySnapshot.size){ // Roadmap sin iniciar
    return 0;
  }else{
    return 1; // Roadmap en progreso
  }
}