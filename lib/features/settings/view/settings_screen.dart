import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/settings/settings.dart';
import 'package:chat_app/router/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
              "Ян Калашников",
              maxLines: 1,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              "в сети",
              style: TextStyle(color: Colors.white70),
            )),
        backgroundColor: theme.primaryColor,
        actions: [
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
                                Icons.edit_outlined,
                                size: 28,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Изменить имя",
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
                            Icons.add_a_photo_outlined,
                            size: 28,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Выбрать фотографию",
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      ],
                    )),
                    PopupMenuItem(
                        onTap: () =>
                            AutoRouter.of(context).replace(const SignInRoute()),
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.exit_to_app_outlined,
                                size: 28,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Выход",
                                style: TextStyle(fontSize: 16),
                              ),
                            )
                          ],
                        ))
                  ]),
        ],
        surfaceTintColor: Colors.transparent,
      ),
      body: ListView(children: [
        DetailInfo(
          titleText: "Аккаунт",
          containerHeight: 205,
          padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 16),
          listWidgets: [
            ListTile(
              onTap: () =>
                  AutoRouter.of(context).push(const UpdateUserPhoneRoute()),
              visualDensity: VisualDensity.compact,
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: const Text(
                "+7 (965) 582-08-60",
                style: TextStyle(fontSize: 14),
              ),
              subtitle: const Text(
                "Нажмите, чтобы изменить номер телефона",
                style: TextStyle(color: Colors.black26, fontSize: 12),
              ),
            ),
            ListTile(
              onTap: () =>
                  AutoRouter.of(context).push(const UpdateUserEmailRoute()),
              visualDensity: VisualDensity.compact,
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: const Text(
                "kalashnikovjan@yandex.ru",
                style: TextStyle(fontSize: 14),
              ),
              subtitle: const Text(
                "Нажмите, чтобы изменить почту",
                style: TextStyle(color: Colors.black26, fontSize: 12),
              ),
            ),
            ListTile(
              onTap: () => AutoRouter.of(context)
                  .push(const UpdateUserDescriptionRoute()),
              visualDensity: VisualDensity.compact,
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: const Text(
                "Level up!",
                style: TextStyle(fontSize: 14),
              ),
              subtitle: const Text(
                "О себе",
                style: TextStyle(color: Colors.black26, fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 16),
          height: 80,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Настройки",
                style: TextStyle(
                    color: theme.primaryColor, fontWeight: FontWeight.w500),
                textAlign: TextAlign.left,
              ),
              Expanded(
                  child: Column(
                children: [
                  ListTile(
                    visualDensity: VisualDensity.compact,
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: const Text(
                      "Язык",
                      style: TextStyle(fontSize: 14),
                    ),
                    leading: const Icon(
                      Icons.language_outlined,
                      color: Colors.black38,
                    ),
                    trailing: Text(
                      "Русский",
                      style: TextStyle(
                          color: theme.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ]),
    );
  }
}
