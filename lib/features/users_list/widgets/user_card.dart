import 'package:auto_route/auto_route.dart';
import 'package:chat_app/repositories/chat/chat.dart';
import 'package:chat_app/repositories/users_list/users_list.dart';
import 'package:chat_app/router/router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.userModel,
  });

  final UserListModel userModel;

  String formatMessageTime(Timestamp? timestamp) {
    if (timestamp == null) {
      return '';
    }

    final now = DateTime.now();
    final messageTime = timestamp.toDate();

    final today = DateTime(now.year, now.month, now.day);
    final messageDay =
        DateTime(messageTime.year, messageTime.month, messageTime.day);

    if (today == messageDay) {
      return '${messageTime.hour}:${messageTime.minute.toString().padLeft(2, '0')}';
    } else {
      return '${messageTime.day.toString().padLeft(2, '0')}.${messageTime.month.toString().padLeft(2, '0')}';
    }
  }

  String? getSubtitleText(UserListModel userModel) {
    if (userModel.lastMessage != null) {
      if (userModel.type == MessageType.image) {
        return 'image';
      } else if (userModel.type == MessageType.video) {
        return 'video';
      } else if (userModel.type == MessageType.audio) {
        return 'audio';
      } else {
        return userModel.lastMessage;
      }
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      margin: const EdgeInsets.all(2),
      child: InkWell(
        onTap: () =>
            AutoRouter.of(context).push(ChatRoute(receiverUser: userModel)),
        child: ListTile(
          leading: CircleAvatar(
            child: userModel.avatar != null
                ? Text(userModel.avatar!)
                : const Icon(Icons.person),
          ),
          title: Text(
            userModel.displayName ?? userModel.email,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            getSubtitleText(userModel)!,
            maxLines: 1,
          ),
          trailing: Text(
            userModel.lastMessageTime != null
                ? formatMessageTime(userModel.lastMessageTime)
                : "",
            style: const TextStyle(color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
