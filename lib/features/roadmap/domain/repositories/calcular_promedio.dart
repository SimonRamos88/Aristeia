import 'package:cloud_firestore/cloud_firestore.dart';

Future<double> calcularPromedio(String? roadmapID) async {
  double sum = 0;
  int n = 0;
  // Instancia de autenticación para obtener el ID del usuario actual
  await FirebaseFirestore.instance.collection('roadmap').doc(roadmapID).collection('calificaciones').get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      sum += doc['calificacion'];
      n++;
    });
  });
  return n > 0 ? sum / n : 0;
}

