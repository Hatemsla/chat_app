import 'package:chat_app/repositories/chat/models/models.dart';
import 'package:chat_app/repositories/users_list/models/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GroupListModel extends ChatModel {
  GroupListModel(
      {required this.uid,
      required this.name,
      required this.members,
      required this.creator,
      required this.isGroup,
      this.avatar,
      this.about,
      this.lastMessage,
      this.lastMessageTime,
      this.type});

  final String uid;
  final String name;
  final String creator;
  final bool isGroup;
  final String? about;
  final List<String> members;
  final String? avatar;
  final String? lastMessage;
  final Timestamp? lastMessageTime;
  final MessageType? type;
}
