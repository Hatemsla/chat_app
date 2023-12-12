import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/contacts/widgets/preload_list_tile.dart';
import 'package:chat_app/features/users_list/bloc/users_list_bloc.dart';
import 'package:chat_app/features/users_list/users_list.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:chat_app/repositories/users_list/users_list.dart';
import 'package:chat_app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final _usersListBloc = UsersListBloc(GetIt.I<AbstractChatsListRepository>());

  @override
  void initState() {
    _usersListBloc.add(LoadUsersList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
        body: ListView(children: [
          PreloadListTile(
            onTap: () =>
                AutoRouter.of(context).push(const AddUsersToGroupRoute()),
            text: S.of(context).createGroup,
            icon: Icons.people_outline_outlined,
          ),
          PreloadListTile(
            onTap: () =>
                AutoRouter.of(context).push(const CreateChannelRoute()),
            text: S.of(context).createChannel,
            icon: Icons.speaker_notes_outlined,
          ),
          Container(
            width: double.infinity,
            height: 30,
            color: Colors.black12,
            margin: EdgeInsets.zero,
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Text(
                  S.of(context).sortingByLoginTime,
                  style: const TextStyle(color: Colors.black38),
                ),
              ),
            ),
          ),
          Column(
            children: [
              BlocBuilder<UsersListBloc, UsersListState>(
                bloc: _usersListBloc,
                builder: (context, state) {
                  if (state is UsersListLoaded) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.chatsList.length,
                      itemBuilder: (context, index) {
                        final chatModel = state.chatsList[index];
                        return UserCard(
                          chatModel: chatModel,
                          isOnlineShow: true,
                          isNeedMessage: true,
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
                            style: theme.textTheme.labelSmall
                                ?.copyWith(fontSize: 16),
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
                  return const Center(
                      child: Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: CircularProgressIndicator(),
                  ));
                },
              ),
            ],
          ),
        ]));
  }
}
