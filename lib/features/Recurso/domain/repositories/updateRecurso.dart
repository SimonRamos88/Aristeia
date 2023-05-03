import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateRecurso(String roadmapID, String bloqueID, String idRecurso,
    Map<String, dynamic> data) async {
  String res = "";

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
    //revisar logica para añadir links_relacionados
    if (data.containsKey("links_relacionados")) {
      Map<String, dynamic> data_map = query.data() as Map<String, dynamic>;
      List<dynamic> linksExistentes = data_map["links_relacionados"] ?? [];
      data["links_relacionados"] = [
        ...linksExistentes,
        ...data["links_relacionados"]
      ];
    }

    await recursoQuery.update(data);
  }
}
