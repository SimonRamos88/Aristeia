import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> pruebasLeer(String collection) async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference collectionReferenceR = db.collection(collection);
  QuerySnapshot query = await collectionReferenceR.get();
  print('Leyendo de la coleccion $collection');
  for (var q in query.docs) {
    print(q.data());
  }
}

Future<void> pruebasLeerSub(
    String collection, String id, String subcollection) async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference collectionReferenceR = db.collection(collection);
  QuerySnapshot query =
      await collectionReferenceR.doc(id).collection(subcollection).get();
  print(
      'Leyendo de la coleccion $collection del documento $id con subcoleccion $subcollection');
  for (var q in query.docs) {
    print(q.data());
  }
}

Future<void> pruebaBorrar(
  String collection,
  String id,
) async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference collectionReferenceR = db.collection(collection);
  await collectionReferenceR.doc(id).delete();
  print('Los datos de la coleccion $collection  fueron borrados');
}

Future<void> pruebaBorrarSub(
    String collection, String id, String nuevaId, String subcollection) async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference collectionReferenceR = db.collection(collection);
  await collectionReferenceR
      .doc(id)
      .collection(subcollection)
      .doc(nuevaId)
      .delete();
  print(
      'Los datos de la coleccion $collection en la subcoleccion $subcollection fueron borrados');
}

Future<void> pruebasSubir(
    String collection, Map<String, dynamic> datos, String id) async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference collectionReferenceR = db.collection(collection);
  await collectionReferenceR.doc(id).set(datos);
  print('Los datos de $collection han sido subidos');
}

Future<void> pruebasSubirSubCollecion(
    String collection,
    Map<String, dynamic> datos,
    String id,
    String nuevaId,
    String subcollection) async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference collectionReferenceR = db.collection(collection);
  await collectionReferenceR
      .doc(id)
      .collection(subcollection)
      .doc(nuevaId)
      .set(datos);
  print(
      'Los datos de la coleccion principal: $collection han sido subidos en la subcoleccion $subcollection');
}
