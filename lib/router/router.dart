import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/add_users_to_group/add_users_to_group.dart';
import 'package:chat_app/features/chat/chat.dart';
import 'package:chat_app/features/contacts/contacts.dart';
import 'package:chat_app/features/create_group/create_group.dart';
import 'package:chat_app/features/settings/settings.dart';
import 'package:chat_app/features/sign_in/sign_in.dart';
import 'package:chat_app/features/sign_up/sign_up.dart';
import 'package:chat_app/features/users_list/users_list.dart';
import 'package:chat_app/features/verify_user/verify_user.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: VerifyUserRoute.page, path: '/'),
        AutoRoute(page: SignInRoute.page, path: '/sing_in'),
        AutoRoute(page: SignUpRoute.page, path: '/sign_up'),
        AutoRoute(page: UsersListRoute.page, path: '/users_list'),
        AutoRoute(page: ChatRoute.page, path: '/user_chat'),
        AutoRoute(page: AddUsersToGroupRoute.page, path: '/add_users_to_group'),
        AutoRoute(page: ContactsRoute.page, path: '/contacts'),
        AutoRoute(page: CreateGroupRoute.page, path: '/create_group'),
        AutoRoute(page: SettingsRoute.page, path: '/settings'),
      ];
}
