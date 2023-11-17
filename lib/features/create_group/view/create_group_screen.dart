import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/add_users_to_group/add_users_to_group.dart';
import 'package:chat_app/router/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        surfaceTintColor: theme.primaryColor,
        title: const Text(
          "Создать группу",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      floatingActionButton: CircleFloatingActionButton(
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
        onPressed: () =>
            AutoRouter.of(context).popAndPush(ChatRoute(isChat: false)),
      ),
      backgroundColor: Colors.blueGrey[50],
      body: Column(children: [
        Container(
          color: Colors.white,
          child: Row(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                height: 70,
                width: 70,
                child: CircleAvatar(
                  backgroundColor: theme.primaryColor,
                  child: const Icon(
                    Icons.add_a_photo,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                    decoration: InputDecoration(
                        hintText: "Введите имя группы",
                        contentPadding: const EdgeInsets.only(bottom: 4),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: theme.primaryColor, width: 2)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: theme.primaryColor, width: 2)),
                        focusColor: theme.primaryColor,
                        isDense: true,
                        suffixIconConstraints: const BoxConstraints(
                            minWidth: 2, minHeight: 32, maxHeight: 100),
                        suffixIcon: InkWell(
                          child: const Icon(
                            Icons.emoji_emotions_outlined,
                            size: 26,
                          ),
                          onTap: () {},
                        )),
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
