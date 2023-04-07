import 'package:cloud_firestore/cloud_firestore.dart';

Future<Map<String, dynamic>> getEtiquetas(String idEtiqueta) async {
  //instanciamos la base de datos
  FirebaseFirestore db = FirebaseFirestore.instance;
  Map<String, dynamic> etiqueta = {"nombre": ""};
  //llamado a la base de datos. Primero le aclaramos a que coleccion llamaremos
  CollectionReference collectionReferenceEtiquetas = db.collection('etiquetas');

  //Ahora hacemos la consulta
  //QuerySnapshot es un objeto que contiene el resultado de una consulta. Tambien
  //puede ser de tipo final
  DocumentSnapshot queryEventos = await collectionReferenceEtiquetas
      .doc(idEtiqueta)
      //es la misma estructura de la consulta que en python
      .get();
  if (queryEventos.exists) {
    etiqueta = queryEventos.data() as Map<String, dynamic>;
  }
  return etiqueta;
}
