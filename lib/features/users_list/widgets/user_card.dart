import 'package:auto_route/auto_route.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:chat_app/repositories/chat/chat.dart';
import 'package:chat_app/repositories/users_list/users_list.dart';
import 'package:chat_app/router/router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.chatModel,
    required this.isOnlineShow,
    required this.isNeedMessage,
  });

  final ChatModel chatModel;
  final bool isOnlineShow;
  final bool isNeedMessage;

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

  String? getSubtitleText(ChatModel chatModel) {
    if (chatModel is UserListModel) {
      if (chatModel.lastMessage != null) {
        if (chatModel.type == MessageType.image) {
          return 'image';
        } else if (chatModel.type == MessageType.video) {
          return 'video';
        } else if (chatModel.type == MessageType.audio) {
          return 'audio';
        } else {
          return chatModel.lastMessage;
        }
      } else {
        return '';
      }
    } else if (chatModel is GroupListModel) {
      if (chatModel.lastMessage != null) {
        if (chatModel.type == MessageType.image) {
          return 'image';
        } else if (chatModel.type == MessageType.video) {
          return 'video';
        } else if (chatModel.type == MessageType.audio) {
          return 'audio';
        } else {
          return chatModel.lastMessage;
        }
      } else {
        return '';
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (chatModel is UserListModel) {
      UserListModel userModel = chatModel as UserListModel;
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        margin: const EdgeInsets.all(2),
        child: InkWell(
          onTap: () {
            if (!isNeedMessage) {
              AutoRouter.of(context)
                  .push(AnotherUserInfoRoute(userModel: userModel));
            } else {
              AutoRouter.of(context).push(ChatRoute(receiverUser: userModel));
            }
          },
          child: ListTile(
            leading: CircleAvatar(
              radius: 24,
              child: userModel.avatar != null
                  ? Text(userModel.avatar!)
                  : const Icon(Icons.person),
            ),
            title: Text(
              userModel.displayName ?? userModel.email,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              (isOnlineShow)
                  ? (userModel.isOnline
                      ? S.of(context).online
                      : S.of(context).wasRecently)
                  : getSubtitleText(userModel)!,
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
    } else {
      GroupListModel groupModel = chatModel as GroupListModel;
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        margin: const EdgeInsets.all(2),
        child: InkWell(
          onTap: () {
            if (groupModel.isGroup) {
              AutoRouter.of(context)
                  .push(GroupChatRoute(groupModel: groupModel));
            } else {
              AutoRouter.of(context)
                  .push(ChannelChatRoute(channelModel: groupModel));
            }
          },
          child: ListTile(
            leading: CircleAvatar(
              radius: 24,
              child: groupModel.avatar != null
                  ? Text(groupModel.avatar!)
                  : const Icon(Icons.person),
            ),
            title: Text(
              groupModel.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              getSubtitleText(groupModel)!,
              maxLines: 1,
            ),
            trailing: Text(
              groupModel.lastMessageTime != null
                  ? formatMessageTime(groupModel.lastMessageTime)
                  : "",
              style: const TextStyle(color: Colors.black54),
            ),
          ),
        ),
      );
    }
  }
}
