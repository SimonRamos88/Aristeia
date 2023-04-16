import 'package:cloud_firestore/cloud_firestore.dart';

Future<List> getEtiquetas() async {
  //instanciamos la base de datos
  FirebaseFirestore db = FirebaseFirestore.instance;
  List etiquetas = [];
  //llamado a la base de datos. Primero le aclaramos a que coleccion llamaremos
  CollectionReference collectionReferenceEtiquetas = db.collection('etiquetas');

  //Ahora hacemos la consulta
  //QuerySnapshot es un objeto que contiene el resultado de una consulta. Tambien
  //puede ser de tipo final
  QuerySnapshot queryEventos = await collectionReferenceEtiquetas
      //es la misma estructura de la consulta que en python
      .get();
  for (var evento in queryEventos.docs) {
    //con docs traemos los documentos
    // y para obtener los datos de este documento usamos data()
    etiquetas.add(evento.data());
  }
  return etiquetas;
}
