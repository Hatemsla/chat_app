import 'package:firebase_auth/firebase_auth.dart';

abstract class AbstractAuthRepository {
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password);
}
