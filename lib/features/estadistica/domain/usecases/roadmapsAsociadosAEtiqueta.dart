import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> incrementarNumeroRoadmapsAsociados(
    List<String> idEtiquetas) async {
  FirebaseFirestore db = FirebaseFirestore.instance;

  for (String idEtiqueta in idEtiquetas) {
    // Obtener la referencia del documento en Firestore
    DocumentReference docRef = db.collection('etiquetas').doc(idEtiqueta);

    // Actualizar el campo "numeroRoadmapsAsociados" del documento
    await docRef.update({
      'numeroRoadmapsAsociados': FieldValue.increment(1),
    });
  }
}

Future<void> decrementarNumeroRoadmapsAsociados(
    List<String> idEtiquetas) async {
  FirebaseFirestore db = FirebaseFirestore.instance;

  for (String idEtiqueta in idEtiquetas) {
    // Obtener la referencia del documento en Firestore
    DocumentReference docRef = db.collection('etiquetas').doc(idEtiqueta);

    // Actualizar el campo "numeroRoadmapsAsociados" del documento
    await docRef.update({
      'numeroRoadmapsAsociados': FieldValue.increment(-1),
    });
  }
}

Future<List<String>> getTopEtiquetas() async {
  final etiquetasSnapshot = await FirebaseFirestore.instance
      .collection('etiquetas')
      .orderBy('numeroRoadmapsAsociados', descending: true)
      .limit(5)
      .get();
  List<String> etiquetas =
      etiquetasSnapshot.docs.map((doc) => doc['nombre'].toString()).toList();

  return etiquetas;
}
