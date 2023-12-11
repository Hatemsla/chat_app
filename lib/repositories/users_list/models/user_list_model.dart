// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:chat_app/repositories/chat/chat.dart';
import 'package:chat_app/repositories/users_list/models/models.dart';

class UserListModel extends ChatModel {
  final String uid;
  final String email;
  final String phoneNumber;
  final String? about;
  final String? displayName;
  final String? avatar;
  final bool isOnline;
  final String? lastMessage;
  final Timestamp? lastMessageTime;
  final MessageType? type;

  UserListModel({
    required this.uid,
    required this.email,
    required this.phoneNumber,
    this.about,
    this.displayName,
    this.avatar,
    required this.isOnline,
    this.lastMessage,
    this.lastMessageTime,
    this.type,
  });
}
