import 'package:firebase_auth/firebase_auth.dart';

import 'firebaseAuth.dart';

Future<String> delete_Auth(String email, String contrasenia) async {
  String result = "";
  try {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    print(user);
    FirebaseAuth.instance.currentUser?.delete();

    result = 'borrado de usuario';
  } on FirebaseAuthException catch (e) {
    result = 'Se ha presentado un error ${e.message}';
  }
  return result;
}
