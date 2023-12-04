import 'package:auto_route/auto_route.dart';
import 'package:chat_app/repositories/auth/auth.dart';
import 'package:chat_app/router/router.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.userModel,
  });

  final UserModel userModel;

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
            userModel.lastMessage ?? "",
            maxLines: 1,
          ),
          trailing: Text(
            userModel.lastMessageTime ?? "",
            style: const TextStyle(color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
