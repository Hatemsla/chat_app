import 'package:chat_app/repositories/auth/auth.dart';

abstract class AbstractUsersListRepository {
  Future<List<UserModel>> getUsersList();
}
