import 'package:firebase_auth/firebase_auth.dart';

abstract class AbstractAuthRepository {
  Future<UserCredential> signInWithEmailandPassword(
      String email, String password);
}
