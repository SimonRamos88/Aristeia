import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> deleteRecurso(
    String roadmapID, String bloqueID, String idRecurso) async {
  bool respuesta = false;
  FirebaseFirestore db = FirebaseFirestore.instance;
  //instanciamos la db y buscamos la coleccion
  CollectionReference collectionReferenceRecurso = db.collection('roadmap');

  var recursoQuery = collectionReferenceRecurso
      .doc(roadmapID)
      .collection('bloques')
      .doc(bloqueID)
      .collection('recursos')
      .doc(idRecurso);
  //antes que nada, verificamos que la informacion esté correcta
  DocumentSnapshot query = await recursoQuery.get();

  if (query.exists) {
    await recursoQuery.delete();
    respuesta = true;
  }
  return respuesta;
}
