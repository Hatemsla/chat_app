import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/add_users_to_group/add_users_to_group.dart';
import 'package:chat_app/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CreateChannelScreen extends StatefulWidget {
  const CreateChannelScreen({super.key});

  @override
  State<CreateChannelScreen> createState() => _CreateChannelScreenState();
}

class _CreateChannelScreenState extends State<CreateChannelScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        surfaceTintColor: theme.primaryColor,
        title: const Text(
          "Создать канал",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      floatingActionButton: CircleFloatingActionButton(
        icon: const Icon(
          CupertinoIcons.arrow_right,
          color: Colors.white,
        ),
        onPressed: () =>
            AutoRouter.of(context).push(const ChooseChannelTypeRoute()),
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
                        hintText: "Имя канала",
                        contentPadding: const EdgeInsets.only(bottom: 4),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black12, width: 2)),
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
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 22, top: 18),
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: TextFormField(
                    maxLength: 600,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Описание",
                      contentPadding: const EdgeInsets.only(bottom: 4),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black12, width: 2)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: theme.primaryColor, width: 2)),
                      focusColor: theme.primaryColor,
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 16, top: 8),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Вы можете добавить несколько строк о себе.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black38, fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}