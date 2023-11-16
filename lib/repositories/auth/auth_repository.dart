import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'abstract_auth_repository.dart';

class AuthRepository extends AbstractAuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return userCredential;
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      throw Exception(e);
    }
  }
}
