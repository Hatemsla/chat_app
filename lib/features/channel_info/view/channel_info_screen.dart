// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/settings/settings.dart';
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
          title: const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text(
                "Название канала",
                softWrap: false,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                "тип канала",
                style: TextStyle(color: Colors.white70),
              )),
          backgroundColor: theme.primaryColor,
          actions: [
            IconButton(
                onPressed: () =>
                    AutoRouter.of(context).push(const UpdateGroupInfoRoute()),
                icon: const Icon(Icons.edit)),
            PopupMenuButton(
                itemBuilder: (context) => [
                      const PopupMenuItem(
                          child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.search,
                              size: 28,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Поиск участников",
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      )),
                      PopupMenuItem(
                          onTap: () => AutoRouter.of(context)
                              .popAndPush(const UsersListRoute()),
                          child: const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.exit_to_app,
                                    size: 28, color: Colors.red),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Удалить канал",
                                  style: TextStyle(
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
              titleText: "Информация",
              containerHeight: 150,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 16),
              listWidgets: [
                ListTile(
                  onTap: () async {
                    await Clipboard.setData(
                        const ClipboardData(text: "Описание группы"));
                    _showSnackBar(context);
                  },
                  visualDensity: VisualDensity.compact,
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    "hate.me/sdahfasjdpfe304",
                    style: TextStyle(fontSize: 14),
                  ),
                  subtitle: const Text(
                    "Ссылка-приглашение",
                    style: TextStyle(fontWeight: FontWeight.normal),
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
            const SizedBox(
              height: 10,
            ),
            // InkWell(
            //   onTap: () => AutoRouter.of(context)
            //       .push(const AddUsersToExistGroupRoute()),
            //   child: Container(
            //     decoration: const BoxDecoration(color: Colors.white),
            //     child: Row(
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.all(12).copyWith(left: 16),
            //           child: Icon(
            //             Icons.person_add_outlined,
            //             color: theme.primaryColor,
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.only(left: 12),
            //           child: Text(
            //             "Добавить участников",
            //             style: TextStyle(
            //                 color: theme.primaryColor,
            //                 fontWeight: FontWeight.normal),
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: ListTile(
                      dense: true,
                      title: const Text(
                        "Подписчики",
                        style: TextStyle(
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
                      title: const Text(
                        "Администраторы",
                        style: TextStyle(
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
