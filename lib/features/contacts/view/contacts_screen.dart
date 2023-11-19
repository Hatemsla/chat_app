import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/add_users_to_group/add_users_to_group.dart';
import 'package:chat_app/router/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final List<Widget> listWidgets = <Widget>[
      PreloadListTile(
        onTap: () => AutoRouter.of(context).push(const AddUsersToGroupRoute()),
        text: "Создать группу",
        icon: Icons.people_outline_outlined,
      ),
      PreloadListTile(
        onTap: () => AutoRouter.of(context).push(const CreateChannelRoute()),
        text: "Создать канал",
        icon: Icons.speaker_notes_outlined,
      ),
      const Card(
        color: Colors.black12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        elevation: 0,
        margin: EdgeInsets.zero,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Text(
            "Сортировка по времени входа",
            style: TextStyle(color: Colors.black38),
          ),
        ),
      ),
      AddUserCard(
        userAvatar: const Icon(Icons.person),
        userName: "Имя",
        userLastConnect: "был(а) недавно",
        onTap: () => AutoRouter.of(context).push(const ChatRoute()),
      ),
      AddUserCard(
        userAvatar: const Icon(Icons.person),
        userName: "Имя",
        userLastConnect: "был(а) недавно",
        onTap: () => AutoRouter.of(context).push(const ChatRoute()),
      ),
      AddUserCard(
        userAvatar: const Icon(Icons.person),
        userName: "Имя",
        userLastConnect: "был(а) недавно",
        onTap: () => AutoRouter.of(context).push(const ChatRoute()),
      ),
      AddUserCard(
        userAvatar: const Icon(Icons.person),
        userName: "Имя",
        userLastConnect: "был(а) недавно",
        onTap: () => AutoRouter.of(context).push(const ChatRoute()),
      ),
      AddUserCard(
        userAvatar: const Icon(Icons.person),
        userName: "Имя",
        userLastConnect: "был(а) недавно",
        onTap: () => AutoRouter.of(context).push(const ChatRoute()),
      ),
      AddUserCard(
        userAvatar: const Icon(Icons.person),
        userName: "Имя",
        userLastConnect: "был(а) недавно",
        onTap: () => AutoRouter.of(context).push(const ChatRoute()),
      ),
      AddUserCard(
        userAvatar: const Icon(Icons.person),
        userName: "Имя",
        userLastConnect: "был(а) недавно",
        onTap: () => AutoRouter.of(context).push(const ChatRoute()),
      ),
      AddUserCard(
        userAvatar: const Icon(Icons.person),
        userName: "Имя",
        userLastConnect: "был(а) недавно",
        onTap: () => AutoRouter.of(context).push(const ChatRoute()),
      ),
      AddUserCard(
        userAvatar: const Icon(Icons.person),
        userName: "Имя",
        userLastConnect: "был(а) недавно",
        onTap: () => AutoRouter.of(context).push(const ChatRoute()),
      ),
      AddUserCard(
        userAvatar: const Icon(Icons.person),
        userName: "Имя",
        userLastConnect: "был(а) недавно",
        onTap: () => AutoRouter.of(context).push(const ChatRoute()),
      ),
      AddUserCard(
        userAvatar: const Icon(Icons.person),
        userName: "Имя",
        userLastConnect: "был(а) недавно",
        onTap: () => AutoRouter.of(context).push(const ChatRoute()),
      ),
    ];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: theme.primaryColor,
          surfaceTintColor: theme.primaryColor,
          title: const Text(
            "Контакты",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.sort_by_alpha))
          ],
        ),
        body: ListView.builder(
            itemCount: listWidgets.length,
            itemBuilder: (context, index) {
              return listWidgets[index];
            }));
  }
}

class PreloadListTile extends StatelessWidget {
  const PreloadListTile({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  final String text;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: Colors.black38),
      title: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
