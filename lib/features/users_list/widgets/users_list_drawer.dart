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
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: IconButton(
                  enableFeedback: false,
                  highlightColor: Colors.transparent,
                  icon: const Icon(
                    Icons.person,
                    color: Colors.black87,
                  ),
                  onPressed: () =>
                      AutoRouter.of(context).popAndPush(const SettingsRoute()),
                ),
              ),
            ),
            decoration: BoxDecoration(color: theme.primaryColor),
          ),
          ListTile(
            leading: const Icon(Icons.people_alt_outlined),
            title: const Text(
              "Создать группу",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            onTap: () =>
                AutoRouter.of(context).popAndPush(const AddUsersToGroupRoute()),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text(
              "Контакты",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            onTap: () =>
                AutoRouter.of(context).popAndPush(const ContactsRoute()),
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text(
              "Настройки",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            onTap: () =>
                AutoRouter.of(context).popAndPush(const SettingsRoute()),
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
