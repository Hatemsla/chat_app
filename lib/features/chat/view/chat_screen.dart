import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/chat/widgets/chat_bubble.dart';
import 'package:chat_app/features/widgets/form_text_field.dart';
import 'package:chat_app/router/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: theme.primaryColor,
          surfaceTintColor: theme.primaryColor,
          title: const ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(
              "Имя",
              maxLines: 1,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              "недавно",
              style: TextStyle(color: Colors.white70),
            ),
          ),
          leading: IconButton(
              onPressed: () {
                AutoRouter.of(context).push(const UsersListRoute());
              },
              icon: const Icon(Icons.arrow_back)),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.phone,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                )),
          ],
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0).copyWith(left: 44),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "почта",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black38),
                          ),
                          ChatBubble(
                              message:
                                  "messagemessagemessagemessagemessagemessagemessagemessagemessagemessagemessage"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.emoji_emotions_outlined,
                      color: Colors.black26,
                      size: 30,
                    )),
                Expanded(
                  child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _messageController,
                      style: TextStyle(
                          fontSize: theme.textTheme.bodyMedium?.fontSize,
                          color: Colors.black),
                      decoration: const InputDecoration(
                          hintText: "Сообщение",
                          hintStyle: TextStyle(color: Colors.black38),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.zero),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.zero))),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.send,
                      color: theme.primaryColor,
                      size: 30,
                    ))
              ],
            )
          ],
        ));
  }
}
