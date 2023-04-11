import 'package:firebase_auth/firebase_auth.dart';

import 'firebaseAuth.dart';

Future<String> CreacionAuth(String email, String contrasenia) async {
  String respuesta = "";
  try {
    final credential = await AuthFirebase().createUserEmail(email, contrasenia);
    respuesta = 'Creacion de usuario';
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      respuesta = 'The password provided is too weak.';
    } else if (e.code == 'email-already-in-use') {
      respuesta = 'The account already exists for that email.';
    }
  } catch (e) {
    respuesta = e.toString();
  }
  return respuesta;
}
