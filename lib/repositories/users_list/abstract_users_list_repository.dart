import 'package:chat_app/repositories/users_list/models/models.dart';

abstract class AbstractUsersListRepository {
  Future<List<UserListModel>> getUsersList();
}
