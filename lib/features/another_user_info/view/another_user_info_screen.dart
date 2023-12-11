// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/settings/settings.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:chat_app/repositories/users_list/users_list.dart';
import 'package:chat_app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@RoutePage()
class AnotherUserInfoScreen extends StatefulWidget {
  const AnotherUserInfoScreen({super.key, required this.userModel});

  final UserListModel userModel;

  @override
  State<AnotherUserInfoScreen> createState() => _AnotherUserInfoScreenState();
}

class _AnotherUserInfoScreenState extends State<AnotherUserInfoScreen> {
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
              widget.userModel.displayName ?? widget.userModel.email,
              softWrap: false,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              widget.userModel.isOnline
                  ? S.of(context).online
                  : S.of(context).recently,
              style: const TextStyle(color: Colors.white70),
            )),
        backgroundColor: theme.primaryColor,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                        onTap: () => AutoRouter.of(context)
                            .push(const UpdateUserNameRoute()),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.block,
                                size: 28,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                S.of(context).block,
                                style: const TextStyle(fontSize: 16),
                              ),
                            )
                          ],
                        )),
                    PopupMenuItem(
                        child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.delete_outline,
                            size: 28,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            S.of(context).delete,
                            style: const TextStyle(fontSize: 16),
                          ),
                        )
                      ],
                    )),
                  ]),
        ],
        surfaceTintColor: Colors.transparent,
      ),
      body: ListView(children: [
        DetailInfo(
          titleText: S.of(context).information,
          containerHeight: 255,
          padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 16),
          listWidgets: [
            ListTile(
              onTap: () async {
                await Clipboard.setData(
                    ClipboardData(text: widget.userModel.phoneNumber));
                _showSnackBar(context);
              },
              visualDensity: VisualDensity.compact,
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: Text(
                widget.userModel.phoneNumber,
                style: const TextStyle(fontSize: 14),
              ),
              subtitle: Text(
                S.of(context).phone,
                style: const TextStyle(color: Colors.black26, fontSize: 12),
              ),
            ),
            ListTile(
              onTap: () async {
                await Clipboard.setData(
                    ClipboardData(text: widget.userModel.about ?? ''));
                _showSnackBar(context);
              },
              visualDensity: VisualDensity.compact,
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: Text(
                S.of(context).userInformation,
                style: const TextStyle(fontSize: 14),
              ),
              subtitle: Text(
                S.of(context).aboutMe,
                style: const TextStyle(color: Colors.black26, fontSize: 12),
              ),
            ),
            ListTile(
              onTap: () async {
                await Clipboard.setData(
                    ClipboardData(text: widget.userModel.email));
                _showSnackBar(context);
              },
              visualDensity: VisualDensity.compact,
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: Text(
                widget.userModel.email,
                style: const TextStyle(fontSize: 14),
              ),
              subtitle: Text(
                S.of(context).userEmail,
                style: const TextStyle(color: Colors.black26, fontSize: 12),
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
      ]),
    );
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
