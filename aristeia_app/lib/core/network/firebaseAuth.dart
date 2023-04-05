import 'package:firebase_auth/firebase_auth.dart';
import 'auth_repository.dart';

class AuthFirebase implements AuthRepository {
  const AuthFirebase();
//esta clase se encarga de autenticar los usuarios y regresarnos si
//está o no registrado en la base de datos
  @override
  Future<UserCredential> signInWithEmail(
    final String username,
    final String password,
  ) {
    return FirebaseAuth.instance.signInWithEmailAndPassword(
      email: username,
      password: password,
    );
  }

  Future<UserCredential> createUserEmail(
    final String username,
    final String password,
  ) {
    return FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: username,
      password: password,
    );
  }
}
