import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'package:chat_app/repositories/chat/abstract_chat_repository.dart';
import 'package:chat_app/repositories/chat/models/message_model.dart';

class ChatRepository extends AbstractChatRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

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
  Future<Message> sendMessage(
      String receiverUid, String message, MessageType type) async {
    try {
      final String currentUserUid = _firebaseAuth.currentUser!.uid;
      final String currentUserEmail =
          _firebaseAuth.currentUser!.email.toString();
      final Timestamp timestamp = Timestamp.now();

      final newMessage = Message(
          senderId: currentUserUid,
          senderEmail: currentUserEmail,
          receiverId: receiverUid,
          message: message,
          timestamp: timestamp,
          type: type);

      final ids = [currentUserUid, receiverUid];
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

  @override
  Future<Message> sendImage(String receiverId, File file) async {
    try {
      final ext = file.path.split('.').last;

      final ref = _storage.ref().child(
          'images/${_firebaseAuth.currentUser!.uid}/${DateTime.now().millisecondsSinceEpoch}.$ext');

      await ref
          .putFile(file, SettableMetadata(contentType: 'image/$ext'))
          .then((p0) {
        GetIt.I<Talker>()
            .info('Data Transferred: ${p0.bytesTransferred / 1000} kb');
      });

      final imageUrl = await ref.getDownloadURL();
      final msg = await sendMessage(receiverId, imageUrl, MessageType.image);

      return msg;
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      throw Exception(st);
    }
  }
}
