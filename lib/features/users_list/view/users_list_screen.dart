// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/users_list/bloc/users_list_bloc.dart';
import 'package:chat_app/features/users_list/widgets/widgets.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:chat_app/repositories/users_list/abstract_users_list_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class UsersListScreen extends StatefulWidget {
  const UsersListScreen({super.key});

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  final _usersListBloc = UsersListBloc(GetIt.I<AbstractUsersListRepository>());

  @override
  void initState() {
    _usersListBloc.add(LoadUsersList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        drawer: UsersListDrawer(),
        drawerEdgeDragWidth: MediaQuery.of(context).size.width / 2,
        appBar: AppBar(
          title: Text(S.of(context).Chats,
              style: const TextStyle(
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
        body: BlocBuilder<UsersListBloc, UsersListState>(
          bloc: _usersListBloc,
          builder: (context, state) {
            if (state is UsersListLoaded) {
              return ListView.builder(
                itemCount: state.usersList.length,
                itemBuilder: (context, index) {
                  final user = state.usersList[index];
                  return UserCard(
                    userModel: user,
                  );
                },
              );
            }
            if (state is UsersListLoadingFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Something went wrong",
                      style: theme.textTheme.headlineMedium,
                    ),
                    Text(
                      "Please try again later",
                      style: theme.textTheme.labelSmall?.copyWith(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButton(
                      onPressed: () {
                        _usersListBloc.add(LoadUsersList());
                      },
                      child: Text(
                        "Try again",
                        style: theme.textTheme.bodySmall,
                      ),
                    )
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
