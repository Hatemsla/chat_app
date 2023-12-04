import 'package:chat_app/repositories/chat/models/message_model.dart';

abstract class AbstractChatRepository {
  Future<List<Message>> getMessages(String userId, String otherUserId);
  Future<Message> sendMessage(String receiverId, String message);
}
