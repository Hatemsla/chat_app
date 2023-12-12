import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/users_list/bloc/users_list_bloc.dart';
import 'package:chat_app/repositories/users_list/abstract_chats_list_repository.dart';
import 'package:chat_app/repositories/users_list/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/generated/l10n.dart';
import 'package:chat_app/router/router.dart';

import 'package:chat_app/features/add_users_to_group/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class AddUsersToGroupScreen extends StatefulWidget {
  const AddUsersToGroupScreen({super.key});

  @override
  State<AddUsersToGroupScreen> createState() => _AddUsersToGroupScreenState();
}

class _AddUsersToGroupScreenState extends State<AddUsersToGroupScreen> {
  final TextEditingController _findUserController = TextEditingController();
  final _usersListBloc = UsersListBloc(GetIt.I<AbstractChatsListRepository>());
  late List<Map<UserListModel, bool>> _selectedUsers;

  @override
  void initState() {
    _usersListBloc.add(LoadUsersList());
    super.initState();
  }

  List<Map<UserListModel, bool>> _convertToMapList(
      List<UserListModel> userList) {
    return userList.map((userModel) => {userModel: false}).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          dense: true,
          title: Text(
            S.of(context).addParticipants,
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            S.of(context).upToNParticipants(200),
            style: const TextStyle(
                color: Colors.white70, fontWeight: FontWeight.normal),
          ),
        ),
        backgroundColor: theme.primaryColor,
      ),
      floatingActionButton: CircleFloatingActionButton(
        icon: const Icon(
          CupertinoIcons.arrow_right,
          color: Colors.white,
        ),
        onPressed: () {
          List<UserListModel> selectedUsers = _selectedUsers
              .where((userMap) => userMap.values.first == true)
              .map((userMap) => userMap.keys.first)
              .toList();
          AutoRouter.of(context)
              .push(CreateGroupRoute(addUsers: selectedUsers));
        },
      ),
      body: Column(
        children: [
          TextFormField(
              keyboardType: TextInputType.text,
              controller: _findUserController,
              style: TextStyle(
                  fontSize: theme.textTheme.bodyMedium?.fontSize,
                  color: Colors.black),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 10),
                  hintText: S.of(context).whoWouldYouLikeToInvite,
                  hintStyle:
                      const TextStyle(color: Colors.black38, fontSize: 14),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.zero),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.zero))),
          BlocBuilder<UsersListBloc, UsersListState>(
            bloc: _usersListBloc,
            builder: (context, state) {
              if (state is UsersListLoaded) {
                _selectedUsers = _convertToMapList(
                    state.chatsList.map((e) => e as UserListModel).toList());
                return Expanded(
                    child: ListView.builder(
                  itemCount: state.chatsList.length,
                  itemBuilder: (context, index) {
                    final userModel = state.chatsList[index];
                    return AddUserCard(
                      userModel: userModel as UserListModel,
                      selectedUsers: _selectedUsers,
                      index: index,
                    );
                  },
                ));
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
                        style:
                            theme.textTheme.labelSmall?.copyWith(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextButton(
                        onPressed: () {
                          _usersListBloc.add(LoadChatsList());
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
          )
        ],
      ),
    );
  }
}
