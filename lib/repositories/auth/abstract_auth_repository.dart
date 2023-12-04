import 'package:chat_app/repositories/auth/models/user_model.dart';

abstract class AbstractAuthRepository {
  Future<UserModel?> signInWithEmailAndPassword(String email, String password);

  Future<UserModel?> createUserWithEmailAndPassword(
      String email, String password, String phone);

  Future<void> signOutUser();
}
