import 'package:chat_app/repositories/auth/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'abstract_auth_repository.dart';

class AuthRepository extends AbstractAuthRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _db;

  AuthRepository(
      {required FirebaseAuth firebaseAuth, required FirebaseFirestore db})
      : _firebaseAuth = firebaseAuth,
        _db = db;

  @override
  Future<UserModel?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());

      final firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        final userData =
            await _db.collection("users").doc(firebaseUser.uid).get();

        if (userData.exists) {
          return UserModel.fromMap(userData.data() as Map<String, dynamic>);
        } else {
          throw Exception();
        }
      }
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      throw FirebaseAuthException(code: e.toString(), message: st.toString());
    }

    return null;
  }

  @override
  Future<UserModel?> createUserWithEmailAndPassword(
      String email, String password, String phone) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());

      final firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        final userModel = UserModel(
            uid: firebaseUser.uid,
            email: email,
            phoneNumber: phone,
            about: null,
            displayName: null,
            avatar: null,
            isOnline: true);

        await _db
            .collection("users")
            .doc(firebaseUser.uid)
            .set(userModel.toMap());

        return userModel;
      }
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      throw FirebaseAuthException(code: e.toString(), message: st.toString());
    }

    return null;
  }

  @override
  Future<void> signOutUser() async {
    final User? firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      try {
        await _db.collection("users").doc(firebaseUser.uid).update({
          'isOnline': false,
        });

        await FirebaseAuth.instance.signOut();
      } catch (e, st) {
        GetIt.I<Talker>().handle(e, st);
        throw FirebaseAuthException(code: e.toString(), message: st.toString());
      }
    }
  }
}
