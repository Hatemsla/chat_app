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
              "User name",
              maxLines: 1,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              "was recently",
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
                            "sender email",
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
                Expanded(
                    child: FormTextField(
                  controller: _messageController,
                  hint: "Enter message",
                  type: TextInputType.text,
                )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.send,
                      color: theme.primaryColor,
                      size: 40,
                    ))
              ],
            )
          ],
        ));
  }
}
