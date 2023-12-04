import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/sign_up/bloc/auth_bloc.dart';
import 'package:chat_app/generated/l10n.dart';
import 'package:chat_app/repositories/auth/abstract_auth_repository.dart';
import 'package:chat_app/repositories/auth/auth.dart';
import 'package:chat_app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class UsersListDrawer extends StatelessWidget {
  UsersListDrawer({
    super.key,
  });

  final _authBloc = AuthBloc(GetIt.I<AbstractAuthRepository>());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final userModel = UserPreferences.userModel!;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              userModel.displayName ?? userModel.email,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            accountEmail: Text(userModel.email,
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
            title: Text(
              S.of(context).createGroup,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            onTap: () =>
                AutoRouter.of(context).popAndPush(const AddUsersToGroupRoute()),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: Text(
              S.of(context).contacts,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            onTap: () =>
                AutoRouter.of(context).popAndPush(const ContactsRoute()),
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: Text(
              S.of(context).settings,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            onTap: () =>
                AutoRouter.of(context).popAndPush(const SettingsRoute()),
          ),
          BlocConsumer<AuthBloc, AuthState>(
            bloc: _authBloc,
            builder: (context, state) {
              return ListTile(
                leading: const Icon(Icons.logout),
                title: Text(
                  S.of(context).exit,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
                onTap: () => _authBloc.add(SignOut()),
              );
            },
            listener: (context, state) {
              if (state is AuthSuccess) {
                AutoRouter.of(context).replace(const SignInRoute());
              } else if (state is AuthFailure) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(
                          state.error.toString(),
                          style: TextStyle(
                              color: theme.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        title: Text(
                          S.of(context).error,
                          style: TextStyle(
                              color: theme.primaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                      );
                    });
              }
            },
          ),
        ],
      ),
    );
  }
}
