import 'package:auto_route/auto_route.dart';
import 'package:chat_app/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

@RoutePage()
class AddUsersToGroupScreen extends StatefulWidget {
  const AddUsersToGroupScreen({super.key});

  @override
  State<AddUsersToGroupScreen> createState() => _AddUsersToGroupScreenState();
}

class _AddUsersToGroupScreenState extends State<AddUsersToGroupScreen> {
  final TextEditingController _findUserController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const ListTile(
          dense: true,
          title: Text(
            "Создать группу",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            "До 200 участников",
            style:
                TextStyle(color: Colors.white70, fontWeight: FontWeight.normal),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_outlined,
              ))
        ],
        backgroundColor: theme.primaryColor,
      ),
      floatingActionButton: CircleFloatingActionButton(
        icon: const Icon(
          CupertinoIcons.arrow_right,
          color: Colors.white,
        ),
        onPressed: () {
          AutoRouter.of(context).push(const CreateGroupRoute());
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
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(0).copyWith(left: 10),
                  hintText: "Кого бы Вы хотели пригласить?",
                  hintStyle:
                      const TextStyle(color: Colors.black38, fontSize: 14),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.zero),
                  focusedBorder: const OutlineInputBorder(
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
