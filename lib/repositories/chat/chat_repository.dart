import 'package:chat_app/repositories/chat/abstract_chat_repository.dart';
import 'package:chat_app/repositories/chat/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class ChatRepository extends AbstractChatRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<List<Message>> getMessages(String userId, String otherUserId) async {
    var messageList = <Message>[];

    final ids = [userId, otherUserId];
    ids.sort();
    final chatRoomId = ids.join("_");
    try {
      final messages = await _db
          .collection("chats")
          .doc(chatRoomId)
          .collection("messages")
          .orderBy('timestamp', descending: false)
          .get();

      for (var doc in messages.docs) {
        messageList.add(Message.fromMap(doc.data()));
      }
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      throw Exception(e);
    }

    return messageList;
  }

  @override
  Future<Message> sendMessage(String receiverId, String message) async {
    try {
      final String currentUserId = _firebaseAuth.currentUser!.uid;
      final String currentUserEmail =
          _firebaseAuth.currentUser!.email.toString();
      final Timestamp timestamp = Timestamp.now();

      final newMessage = Message(
          senderId: currentUserId,
          senderEmail: currentUserEmail,
          receiverId: receiverId,
          message: message,
          timestamp: timestamp);

      final ids = [currentUserId, receiverId];
      ids.sort();
      final chatRoomId = ids.join("_");

      await _db
          .collection("chats")
          .doc(chatRoomId)
          .collection("messages")
          .add(newMessage.toMap());

      return newMessage;
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      throw Exception(st);
    }
  }
}
