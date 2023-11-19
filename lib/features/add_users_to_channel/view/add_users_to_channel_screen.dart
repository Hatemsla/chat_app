import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/add_users_to_group/add_users_to_group.dart';
import 'package:chat_app/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AddUsersToChannelScreen extends StatefulWidget {
  const AddUsersToChannelScreen({super.key});

  @override
  State<AddUsersToChannelScreen> createState() =>
      _AddUsersToChannelScreenState();
}

class _AddUsersToChannelScreenState extends State<AddUsersToChannelScreen> {
  final TextEditingController _findUserController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const ListTile(
          dense: true,
          contentPadding: EdgeInsets.zero,
          title: Text(
            "Добавить подписчиков",
            softWrap: false,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            "0 участников",
            style:
                TextStyle(color: Colors.white70, fontWeight: FontWeight.normal),
          ),
        ),
        backgroundColor: theme.primaryColor,
      ),
      floatingActionButton: CircleFloatingActionButton(
        icon: const Icon(
          CupertinoIcons.arrow_right,
          color: Colors.white,
        ),
        onPressed: () {
          AutoRouter.of(context).popAndPush(const CreateGroupRoute());
        },
      ),
      body: Column(
        children: [
          TextFormField(
              keyboardType: TextInputType.text,
              controller: _findUserController,
              style: TextStyle(
                  fontSize: theme.textTheme.bodyMedium?.fontSize,
                  color: Colors.black),
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  hintText: "Кого бы Вы хотели пригласить?",
                  hintStyle: TextStyle(color: Colors.black38, fontSize: 14),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.zero),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.zero))),
          Expanded(child: ListView.builder(
            itemBuilder: (context, index) {
              return const AddUserCard(
                userAvatar: Icon(Icons.person),
                userName: 'Имя',
                userLastConnect: 'был(а) недавно',
              );
            },
          ))
        ],
      ),
    );
  }
}
