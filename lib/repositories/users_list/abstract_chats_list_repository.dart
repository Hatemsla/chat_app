import 'package:chat_app/repositories/users_list/models/models.dart';

abstract class AbstractChatsListRepository {
  Future<List<ChatModel>> getChatsList();
  Future<List<UserListModel>> getUsersList();
  Future<List<UserListModel>> getGroupUsersList(String groupId);
}
