import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/add_users_to_group/add_users_to_group.dart';
import 'package:chat_app/features/contacts/widgets/preload_list_tile.dart';
import 'package:chat_app/generated/l10n.dart';
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
        text: S.of(context).createGroup,
        icon: Icons.people_outline_outlined,
      ),
      PreloadListTile(
        onTap: () => AutoRouter.of(context).push(const CreateChannelRoute()),
        text: S.of(context).createChannel,
        icon: Icons.speaker_notes_outlined,
      ),
      Card(
        color: Colors.black12,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        elevation: 0,
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Text(
            S.of(context).sortingByLoginTime,
            style: const TextStyle(color: Colors.black38),
          ),
        ),
      ),
      AddUserCard(
        userAvatar: const Icon(Icons.person),
        userName: "Имя",
        userLastConnect: S.of(context).wasRecently,
        onTap: () => AutoRouter.of(context).push(const ChatRoute()),
      ),
      AddUserCard(
        userAvatar: const Icon(Icons.person),
        userName: "Имя",
        userLastConnect: S.of(context).wasRecently,
        onTap: () => AutoRouter.of(context).push(const ChatRoute()),
      ),
      AddUserCard(
        userAvatar: const Icon(Icons.person),
        userName: "Имя",
        userLastConnect: S.of(context).wasRecently,
        onTap: () => AutoRouter.of(context).push(const ChatRoute()),
      ),
      AddUserCard(
        userAvatar: const Icon(Icons.person),
        userName: "Имя",
        userLastConnect: S.of(context).wasRecently,
        onTap: () => AutoRouter.of(context).push(const ChatRoute()),
      ),
      AddUserCard(
        userAvatar: const Icon(Icons.person),
        userName: "Имя",
        userLastConnect: S.of(context).wasRecently,
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
          title: Text(
            S.of(context).contacts,
            style: const TextStyle(
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
