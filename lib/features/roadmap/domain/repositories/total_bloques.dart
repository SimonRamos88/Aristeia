import 'package:cloud_firestore/cloud_firestore.dart';

Future<int> totalBloques(String? roadmapID) async {
  final querySnapshot =
  await FirebaseFirestore.instance.collection('roadmap').doc(roadmapID).collection('bloques').get();
  final size = querySnapshot.size;
  return size;
}