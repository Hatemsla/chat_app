import 'package:flutter/material.dart';

class AddUserCard extends StatelessWidget {
  const AddUserCard({
    super.key,
    required this.userAvatar,
    required this.userName,
    required this.userLastConnect,
    this.margin = const EdgeInsets.all(2),
    this.onTap,
  });

  final Widget userAvatar;
  final String userName;
  final String userLastConnect;
  final EdgeInsets? margin;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      margin: margin,
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          leading: CircleAvatar(
            child: userAvatar,
          ),
          title: Text(
            userName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            userLastConnect,
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
