// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/users_list/widgets/widgets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UsersListScreen extends StatelessWidget {
  const UsersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        drawer: const UsersListDrawer(),
        drawerEdgeDragWidth: MediaQuery.of(context).size.width / 2,
        appBar: AppBar(
          title: const Text('Чаты',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600)),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_outlined,
                ))
          ],
          backgroundColor: theme.primaryColor,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return const UserCard(
              userAvatar: Icon(Icons.person),
              userName: 'Имя',
              userLastMessage: 'Последнее собщение',
              userLastMessageTime: '12:00',
            );
          },
        ));
  }
}
