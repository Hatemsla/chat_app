import 'package:auto_route/auto_route.dart';
import 'package:chat_app/router/router.dart';
import 'package:flutter/material.dart';

class UsersListDrawer extends StatelessWidget {
  const UsersListDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              "Ян Калашников",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            accountEmail: Text("kalashnikovjan@yandex.ru",
                style: TextStyle(
                    fontSize: 14, color: Colors.white.withOpacity(0.7))),
            currentAccountPicture: const CircleAvatar(
              child: ClipOval(
                child: Icon(Icons.person),
              ),
            ),
            decoration: BoxDecoration(color: theme.primaryColor),
          ),
          const ListTile(
            leading: Icon(Icons.people_alt_outlined),
            title: Text(
              "Создать группу",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.person_outline),
            title: Text(
              "Контакты",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.settings_outlined),
            title: Text(
              "Настройки",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              "Выйти",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            onTap: () => AutoRouter.of(context).replace(const SignUpRoute()),
          ),
        ],
      ),
    );
  }
}
