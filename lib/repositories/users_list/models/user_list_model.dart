import 'package:chat_app/repositories/chat/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserListModel {
  UserListModel(
      {required this.uid,
      required this.email,
      this.displayName,
      this.avatar,
      required this.isOnline,
      this.lastMessage,
      this.lastMessageTime,
      this.type});

  final String uid;
  final String email;
  final String? displayName;
  final String? avatar;
  final bool isOnline;
  final String? lastMessage;
  final Timestamp? lastMessageTime;
  final MessageType? type;
}
