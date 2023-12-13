import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/add_users_to_group/add_users_to_group.dart';
import 'package:chat_app/features/create_group/bloc/create_group_bloc.dart';
import 'package:chat_app/features/users_list/bloc/users_list_bloc.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:chat_app/repositories/group/group.dart';
import 'package:chat_app/repositories/users_list/users_list.dart';
import 'package:chat_app/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class AddUsersToExistGroupScreen extends StatefulWidget {
  const AddUsersToExistGroupScreen({super.key, required this.groupModel});

  final GroupListModel groupModel;

  @override
  State<AddUsersToExistGroupScreen> createState() =>
      _AddUsersToExistGroupScreenState();
}

class _AddUsersToExistGroupScreenState
    extends State<AddUsersToExistGroupScreen> {
  final TextEditingController _findUserController = TextEditingController();
  final _usersListBloc = UsersListBloc(GetIt.I<AbstractChatsListRepository>());
  final _createGroupBloc = CreateGroupBloc(GetIt.I<AbstractGroupRepository>());
  late List<Map<UserListModel, bool>> _selectedUsers;
  var selectedUsers = <UserListModel>[];

  @override
  void initState() {
    _usersListBloc.add(LoadNotGroupMembersList(groupId: widget.groupModel.uid));
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
        leading: IconButton(
            onPressed: () {
              if (widget.groupModel.isGroup) {
                AutoRouter.of(context).popAndPush(
                    GroupChatInfoRoute(groupModel: widget.groupModel));
              } else {
                AutoRouter.of(context).popAndPush(
                    ChannelChatInfoRoute(channelModel: widget.groupModel));
              }
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text(
          S.of(context).addParticipants,
          style: const TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: theme.primaryColor,
      ),
      floatingActionButton: BlocConsumer<CreateGroupBloc, CreateGroupState>(
        bloc: _createGroupBloc,
        listener: (context, state) {
          if (state is AddMemebersToExistGroupSuccess) {
            if (widget.groupModel.isGroup) {
              AutoRouter.of(context).popAndPush(
                  GroupChatInfoRoute(groupModel: widget.groupModel));
            } else {
              widget.groupModel.members.addAll(selectedUsers.map((e) => e.uid));
              AutoRouter.of(context).popAndPush(
                  ChannelChatInfoRoute(channelModel: widget.groupModel));
            }
          } else if (state is CreateGroupFailure) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text(
                      state.exception.toString(),
                      style: TextStyle(
                          color: theme.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    title: Text(
                      S.of(context).error,
                      style: TextStyle(
                          color: theme.primaryColor,
                          fontWeight: FontWeight.w500),
                    ),
                  );
                });
          }
        },
        builder: (context, state) {
          return CircleFloatingActionButton(
            icon: const Icon(
              CupertinoIcons.check_mark,
              color: Colors.white,
            ),
            onPressed: () {
              selectedUsers = _selectedUsers
                  .where((userMap) => userMap.values.first == true)
                  .map((userMap) => userMap.keys.first)
                  .toList();
              _createGroupBloc.add(AddMemebersToExistGroup(
                  groupId: widget.groupModel.uid, newMemebers: selectedUsers));
            },
          );
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
