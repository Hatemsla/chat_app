// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddUsersToGroupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddUsersToGroupScreen(),
      );
    },
    ChatRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChatScreen(
          key: args.key,
          isChat: args.isChat,
        ),
      );
    },
    ContactsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ContactsScreen(),
      );
    },
    CreateGroupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateGroupScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpScreen(),
      );
    },
    UsersListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UsersListScreen(),
      );
    },
    VerifyUserRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const VerifyUserScreen(),
      );
    },
  };
}

/// generated route for
/// [AddUsersToGroupScreen]
class AddUsersToGroupRoute extends PageRouteInfo<void> {
  const AddUsersToGroupRoute({List<PageRouteInfo>? children})
      : super(
          AddUsersToGroupRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddUsersToGroupRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChatScreen]
class ChatRoute extends PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    Key? key,
    required bool isChat,
    List<PageRouteInfo>? children,
  }) : super(
          ChatRoute.name,
          args: ChatRouteArgs(
            key: key,
            isChat: isChat,
          ),
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const PageInfo<ChatRouteArgs> page = PageInfo<ChatRouteArgs>(name);
}

class ChatRouteArgs {
  const ChatRouteArgs({
    this.key,
    required this.isChat,
  });

  final Key? key;

  final bool isChat;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key, isChat: $isChat}';
  }
}

/// generated route for
/// [ContactsScreen]
class ContactsRoute extends PageRouteInfo<void> {
  const ContactsRoute({List<PageRouteInfo>? children})
      : super(
          ContactsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateGroupScreen]
class CreateGroupRoute extends PageRouteInfo<void> {
  const CreateGroupRoute({List<PageRouteInfo>? children})
      : super(
          CreateGroupRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateGroupRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInScreen]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpScreen]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UsersListScreen]
class UsersListRoute extends PageRouteInfo<void> {
  const UsersListRoute({List<PageRouteInfo>? children})
      : super(
          UsersListRoute.name,
          initialChildren: children,
        );

  static const String name = 'UsersListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VerifyUserScreen]
class VerifyUserRoute extends PageRouteInfo<void> {
  const VerifyUserRoute({List<PageRouteInfo>? children})
      : super(
          VerifyUserRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyUserRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
