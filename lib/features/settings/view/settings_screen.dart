import 'package:auto_route/auto_route.dart';
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            title: const ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: Text(
                  "Ян Калашников",
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  "в сети",
                  style: TextStyle(color: Colors.white70),
                )),
            backgroundColor: theme.primaryColor,
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.search_outlined)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
            ],
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back),
            ),
            surfaceTintColor: Colors.transparent,
          ),
          SliverList.list(children: [
            Container(
              alignment: Alignment.centerLeft,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
              height: 205,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Аккаунт",
                    style: TextStyle(
                        color: theme.primaryColor, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                  Expanded(
                      child: ListView(
                    padding: EdgeInsets.zero,
                    children: const [
                      ListTile(
                        visualDensity: VisualDensity.compact,
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          "+7 (965) 582-08-60",
                          style: TextStyle(fontSize: 14),
                        ),
                        subtitle: Text(
                          "Нажмите, чтобы изменить номер телефона",
                          style: TextStyle(color: Colors.black26, fontSize: 12),
                        ),
                      ),
                      ListTile(
                        visualDensity: VisualDensity.compact,
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          "@Hatemsla",
                          style: TextStyle(fontSize: 14),
                        ),
                        subtitle: Text(
                          "Имя пользователя",
                          style: TextStyle(color: Colors.black26, fontSize: 12),
                        ),
                      ),
                      ListTile(
                        visualDensity: VisualDensity.compact,
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          "Level up!",
                          style: TextStyle(fontSize: 14),
                        ),
                        subtitle: Text(
                          "О себе",
                          style: TextStyle(color: Colors.black26, fontSize: 12),
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
              height: 370,
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
                      child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      const ListTile(
                        visualDensity: VisualDensity.compact,
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          "Настройки чатов",
                          style: TextStyle(fontSize: 14),
                        ),
                        leading: Icon(
                          Icons.message_outlined,
                          color: Colors.black38,
                        ),
                      ),
                      const ListTile(
                        visualDensity: VisualDensity.compact,
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          "Конфиденциальность",
                          style: TextStyle(fontSize: 14),
                        ),
                        leading: Icon(
                          Icons.lock_outline,
                          color: Colors.black38,
                        ),
                      ),
                      const ListTile(
                        visualDensity: VisualDensity.compact,
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          "Уведомления и звуки",
                          style: TextStyle(fontSize: 14),
                        ),
                        leading: Icon(
                          Icons.notifications_outlined,
                          color: Colors.black38,
                        ),
                      ),
                      const ListTile(
                        visualDensity: VisualDensity.compact,
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          "Данные и память",
                          style: TextStyle(fontSize: 14),
                        ),
                        leading: Icon(
                          Icons.memory_outlined,
                          color: Colors.black38,
                        ),
                      ),
                      const ListTile(
                        visualDensity: VisualDensity.compact,
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          "Энергосбережение",
                          style: TextStyle(fontSize: 14),
                        ),
                        leading: Icon(
                          Icons.energy_savings_leaf_outlined,
                          color: Colors.black38,
                        ),
                      ),
                      const ListTile(
                        visualDensity: VisualDensity.compact,
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          "Папки с чатами",
                          style: TextStyle(fontSize: 14),
                        ),
                        leading: Icon(
                          Icons.folder_outlined,
                          color: Colors.black38,
                        ),
                      ),
                      const ListTile(
                        visualDensity: VisualDensity.compact,
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          "Устройства",
                          style: TextStyle(fontSize: 14),
                        ),
                        leading: Icon(
                          Icons.devices_other_outlined,
                          color: Colors.black38,
                        ),
                      ),
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
        ],
      ),
    );
  }
}
