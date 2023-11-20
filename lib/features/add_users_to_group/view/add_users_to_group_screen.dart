import 'package:auto_route/auto_route.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:chat_app/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

@RoutePage()
class AddUsersToGroupScreen extends StatefulWidget {
  const AddUsersToGroupScreen({super.key});

  @override
  State<AddUsersToGroupScreen> createState() => _AddUsersToGroupScreenState();
}

class _AddUsersToGroupScreenState extends State<AddUsersToGroupScreen> {
  final TextEditingController _findUserController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          dense: true,
          title: Text(
            S.of(context).createGroup,
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
          AutoRouter.of(context).popAndPush(const CreateGroupRoute());
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
          Expanded(child: ListView.builder(
            itemBuilder: (context, index) {
              return AddUserCard(
                userAvatar: const Icon(Icons.person),
                userName: 'Имя',
                userLastConnect: S.of(context).wasRecently,
              );
            },
          ))
        ],
      ),
    );
  }
}
