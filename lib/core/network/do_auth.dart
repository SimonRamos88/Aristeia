import 'package:firebase_auth/firebase_auth.dart';

import 'firebaseAuth.dart';

Future<String> do_Auth(String email, String contrasenia) async {
  String result = "";
  try {
    UserCredential prueba = await const AuthFirebase().signInWithEmail(
      email,
      contrasenia,
    );

    result = 'Inicio de sesion exitoso';
  } on FirebaseAuthException catch (e) {
    result = 'Se ha presentado un error ${e.message}';
  }
  return result;
}
