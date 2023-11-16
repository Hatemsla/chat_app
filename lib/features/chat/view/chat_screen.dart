import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
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
                onPressed: () {}, icon: const Icon(Icons.arrow_back)),
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
            backgroundColor: theme.primaryColor,
          ),
          SliverList.builder(
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                elevation: 1,
                color: theme.primaryColor.withOpacity(0.2),
                margin: const EdgeInsets.all(4),
                child: const InkWell(
                  child: ListTile(
                    title: Text("Message"),
                    trailing: Text(
                      "12:00PM",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
