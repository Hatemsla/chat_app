// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/settings/settings.dart';
import 'package:chat_app/features/users_list/bloc/users_list_bloc.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:chat_app/repositories/auth/auth.dart';
import 'package:chat_app/repositories/users_list/users_list.dart';
import 'package:chat_app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class ChannelChatInfoScreen extends StatefulWidget {
  const ChannelChatInfoScreen({super.key, required this.channelModel});

  final GroupListModel channelModel;

  @override
  State<ChannelChatInfoScreen> createState() => _ChannelChatInfoScreenState();
}

class _ChannelChatInfoScreenState extends State<ChannelChatInfoScreen> {
  bool _notifications = true;
  final _usersListBloc = UsersListBloc(GetIt.I<AbstractChatsListRepository>());

  @override
  void initState() {
    _usersListBloc.add(LoadGroupUsersList(groupId: widget.channelModel.uid));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          title: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text(
                widget.channelModel.name,
                softWrap: false,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                S.of(context).publicChannel,
                style: const TextStyle(color: Colors.white70),
              )),
          backgroundColor: theme.primaryColor,
          actions: [
            IconButton(
                onPressed: () =>
                    AutoRouter.of(context).push(const UpdateGroupInfoRoute()),
                icon: const Icon(Icons.edit)),
            PopupMenuButton(
                itemBuilder: (context) => [
                      PopupMenuItem(
                          child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.search,
                              size: 28,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              S.of(context).searchForParticipants,
                              style: const TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      )),
                      PopupMenuItem(
                          onTap: () => AutoRouter.of(context)
                              .popAndPush(const UsersListRoute()),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.exit_to_app,
                                    size: 28, color: Colors.red),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  S.of(context).deleteChannel,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.red),
                                ),
                              )
                            ],
                          )),
                    ]),
          ],
          surfaceTintColor: Colors.transparent,
        ),
        body: ListView(
          children: [
            DetailInfo(
              titleText: S.of(context).information,
              containerHeight: 150,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 16),
              listWidgets: [
                ListTile(
                  onTap: () async {
                    await Clipboard.setData(
                        ClipboardData(text: S.of(context).groupDescription));
                    _showSnackBar(context);
                  },
                  visualDensity: VisualDensity.compact,
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    widget.channelModel.about ?? '',
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                ListTile(
                  visualDensity: VisualDensity.compact,
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    S.of(context).notifications,
                    style: const TextStyle(fontSize: 14),
                  ),
                  subtitle: Text(
                    (_notifications)
                        ? S.of(context).enabled
                        : S.of(context).disabled,
                    style: const TextStyle(color: Colors.black26, fontSize: 12),
                  ),
                  trailing: Transform.scale(
                    scale: 0.8,
                    child: Switch(
                        activeColor: theme.primaryColor,
                        value: _notifications,
                        onChanged: (val) {
                          setState(() {
                            _notifications = val;
                          });
                        }),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => AutoRouter.of(context).popAndPush(
                  AddUsersToExistGroupRoute(groupModel: widget.channelModel)),
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12).copyWith(left: 16),
                      child: Icon(
                        Icons.person_add_outlined,
                        color: theme.primaryColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        S.of(context).addParticipants,
                        style: TextStyle(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.normal),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            if (UserPreferences.userModel!.uid == widget.channelModel.creator)
              Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      child: ListTile(
                        dense: true,
                        title: Text(
                          S.of(context).subscribers,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                        leading: const Icon(
                          Icons.people_outline,
                          color: Colors.black45,
                        ),
                        trailing: Text(
                          (widget.channelModel.members.length - 1).toString(),
                          style: TextStyle(
                              color: theme.primaryColor, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      child: ListTile(
                        dense: true,
                        title: Text(
                          S.of(context).administrators,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                        leading: const Icon(
                          Icons.stars_outlined,
                          color: Colors.black45,
                        ),
                        trailing: Text(
                          "1",
                          style: TextStyle(
                              color: theme.primaryColor, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ));
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.black.withOpacity(0.7),
        behavior: SnackBarBehavior.floating,
        duration: Durations.medium3,
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        content: Row(
          children: [
            const Icon(
              Icons.copy,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                S.of(context).theTextIsCopiedToTheClipboard,
                style: const TextStyle(fontWeight: FontWeight.normal),
              ),
            )
          ],
        )));
  }
}
