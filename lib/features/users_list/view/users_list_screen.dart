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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            title: Text('Chat App', style: theme.textTheme.headlineSmall),
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search_outlined,
                  ))
            ],
            backgroundColor: theme.primaryColor,
          ),
          SliverList.builder(
            itemBuilder: (context, index) {
              return const UserCard(
                userAvatar: Icon(Icons.person),
                userName: 'Some name',
                userLastMessage: 'Last user message',
                userLastMessageTime: '12:00 PM',
              );
            },
          )
        ],
      ),
    );
  }
}
