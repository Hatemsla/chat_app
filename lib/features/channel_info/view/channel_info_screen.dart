// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/settings/settings.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:chat_app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@RoutePage()
class ChannelChatInfoScreen extends StatefulWidget {
  const ChannelChatInfoScreen({super.key});

  @override
  State<ChannelChatInfoScreen> createState() => _ChannelChatInfoScreenState();
}

class _ChannelChatInfoScreenState extends State<ChannelChatInfoScreen> {
  bool _notifications = true;

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
                S.of(context).channelName,
                softWrap: false,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                S.of(context).channelType,
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
                  title: const Text(
                    "hate.me/sdahfasjdpfe304",
                    style: TextStyle(fontSize: 14),
                  ),
                  subtitle: Text(
                    S.of(context).invitationLink,
                    style: const TextStyle(fontWeight: FontWeight.normal),
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
                        "1",
                        style:
                            TextStyle(color: theme.primaryColor, fontSize: 14),
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
                        style:
                            TextStyle(color: theme.primaryColor, fontSize: 14),
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
