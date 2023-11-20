// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/settings/settings.dart';
import 'package:chat_app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@RoutePage()
class AnotherUserInfoScreen extends StatefulWidget {
  const AnotherUserInfoScreen({super.key});

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
        title: const ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(
              "Другой пользователь",
              softWrap: false,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              "в сети",
              style: TextStyle(color: Colors.white70),
            )),
        backgroundColor: theme.primaryColor,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                        onTap: () => AutoRouter.of(context)
                            .push(const UpdateUserNameRoute()),
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.block,
                                size: 28,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Заблокировать",
                                style: TextStyle(fontSize: 16),
                              ),
                            )
                          ],
                        )),
                    const PopupMenuItem(
                        child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.delete_outline,
                            size: 28,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Удалить",
                            style: TextStyle(fontSize: 16),
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
          titleText: "Информация",
          containerHeight: 255,
          padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 16),
          listWidgets: [
            ListTile(
              onTap: () async {
                await Clipboard.setData(
                    const ClipboardData(text: "+7 (965) 582-08-60"));
                _showSnackBar(context);
              },
              visualDensity: VisualDensity.compact,
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: const Text(
                "+7 (965) 582-08-60",
                style: TextStyle(fontSize: 14),
              ),
              subtitle: const Text(
                "Телефон",
                style: TextStyle(color: Colors.black26, fontSize: 12),
              ),
            ),
            ListTile(
              onTap: () async {
                await Clipboard.setData(
                    const ClipboardData(text: "Информация о пользователе"));
                _showSnackBar(context);
              },
              visualDensity: VisualDensity.compact,
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: const Text(
                "Информация о пользователе",
                style: TextStyle(fontSize: 14),
              ),
              subtitle: const Text(
                "О себе",
                style: TextStyle(color: Colors.black26, fontSize: 12),
              ),
            ),
            ListTile(
              onTap: () async {
                await Clipboard.setData(
                    const ClipboardData(text: "kalashnikovjan@yandex.ru"));
                _showSnackBar(context);
              },
              visualDensity: VisualDensity.compact,
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: const Text(
                "kalashnikovjan@yandex.ru",
                style: TextStyle(fontSize: 14),
              ),
              subtitle: const Text(
                "Почта пользователя",
                style: TextStyle(color: Colors.black26, fontSize: 12),
              ),
            ),
            ListTile(
              visualDensity: VisualDensity.compact,
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: const Text(
                "Уведомления",
                style: TextStyle(fontSize: 14),
              ),
              subtitle: Text(
                (_notifications) ? "Включены" : "Выключены",
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
        content: const Row(
          children: [
            Icon(
              Icons.copy,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                "Текст скопирован в буффер обмена.",
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
            )
          ],
        )));
  }
}
