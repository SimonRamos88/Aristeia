import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateEtiqueta(
    String idEtiqueta, Map<String, dynamic> data) async {
  //instanciamos la base de datos
  FirebaseFirestore db = FirebaseFirestore.instance;
  //llamado a la base de datos. Primero le aclaramos a que coleccion llamaremos
  CollectionReference collectionReferenceEtiquetas = db.collection('etiquetas');

  //Ahora hacemos la consulta
  //QuerySnapshot es un objeto que contiene el resultado de una consulta. Tambien
  //puede ser de tipo final
  DocumentSnapshot query =
      await collectionReferenceEtiquetas.doc(idEtiqueta).get();
  if (query.exists) {
    await collectionReferenceEtiquetas.doc(idEtiqueta).update(data);
  }
  //es la misma estructura de la consulta que en python
}

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
