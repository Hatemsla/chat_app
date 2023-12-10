import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/add_users_to_group/add_users_to_group.dart';
import 'package:chat_app/features/create_group/bloc/create_group_bloc.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:chat_app/repositories/group/group.dart';
import 'package:chat_app/repositories/users_list/models/models.dart';
import 'package:chat_app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key, required this.addUsers});

  final List<UserListModel> addUsers;

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  final _createGroupBloc = CreateGroupBloc(GetIt.I<AbstractGroupRepository>());
  final TextEditingController _groupName = TextEditingController();

  @override
  void dispose() {
    _groupName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        surfaceTintColor: theme.primaryColor,
        title: Text(
          S.of(context).createGroup,
          style: const TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      floatingActionButton: BlocConsumer<CreateGroupBloc, CreateGroupState>(
        bloc: _createGroupBloc,
        builder: (context, state) {
          return CircleFloatingActionButton(
            icon: const Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: () => _createGroupBloc.add(CreateGroup(
                groupName: _groupName.text,
                avatar: null,
                memebers: widget.addUsers)),
          );
        },
        listener: (context, state) {
          if (state is CreateGroupSuccess) {
            AutoRouter.of(context).popAndPush(const GroupChatRoute());
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
      ),
      backgroundColor: Colors.blueGrey[50],
      body: Column(children: [
        Container(
          color: Colors.white,
          child: Row(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                height: 70,
                width: 70,
                child: CircleAvatar(
                  backgroundColor: theme.primaryColor,
                  child: const Icon(
                    Icons.add_a_photo,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                    decoration: InputDecoration(
                        hintText: S.of(context).enterTheNameOfTheGroup,
                        contentPadding: const EdgeInsets.only(bottom: 4),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: theme.primaryColor, width: 2)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: theme.primaryColor, width: 2)),
                        focusColor: theme.primaryColor,
                        isDense: true,
                        suffixIconConstraints: const BoxConstraints(
                            minWidth: 2, minHeight: 32, maxHeight: 100),
                        suffixIcon: InkWell(
                          child: const Icon(
                            Icons.emoji_emotions_outlined,
                            size: 26,
                          ),
                          onTap: () {},
                        )),
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
