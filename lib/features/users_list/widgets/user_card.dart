import 'package:auto_route/auto_route.dart';
import 'package:chat_app/router/router.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.userAvatar,
    required this.userName,
    required this.userLastMessage,
    required this.userLastMessageTime,
  });

  final Widget userAvatar;
  final String userName;
  final String userLastMessage;
  final String userLastMessageTime;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      margin: const EdgeInsets.all(2),
      child: InkWell(
        onTap: () => AutoRouter.of(context).push(const ChatRoute()),
        child: ListTile(
          leading: CircleAvatar(
            child: userAvatar,
          ),
          title: Text(userName),
          subtitle: Text(
            userLastMessage,
            maxLines: 1,
          ),
          trailing: Text(
            userLastMessageTime,
            style: const TextStyle(color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
