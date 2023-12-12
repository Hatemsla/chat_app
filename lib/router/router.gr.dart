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
    AddUsersToChannelRoute.name: (routeData) {
      final args = routeData.argsAs<AddUsersToChannelRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddUsersToChannelScreen(
          key: args.key,
          channelName: args.channelName,
          about: args.about,
          avatar: args.avatar,
        ),
      );
    },
    AddUsersToExistGroupRoute.name: (routeData) {
      final args = routeData.argsAs<AddUsersToExistGroupRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddUsersToExistGroupScreen(
          key: args.key,
          groupModel: args.groupModel,
        ),
      );
    },
    AddUsersToGroupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddUsersToGroupScreen(),
      );
    },
    AnotherUserInfoRoute.name: (routeData) {
      final args = routeData.argsAs<AnotherUserInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AnotherUserInfoScreen(
          key: args.key,
          userModel: args.userModel,
        ),
      );
    },
    ChannelChatInfoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChannelChatInfoScreen(),
      );
    },
    ChannelChatRoute.name: (routeData) {
      final args = routeData.argsAs<ChannelChatRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChannelChatScreen(
          key: args.key,
          channelModel: args.channelListModel,
        ),
      );
    },
    ChatRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChatScreen(
          key: args.key,
          receiverUser: args.receiverUser,
        ),
      );
    },
    ChooseChannelTypeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChooseChannelTypeScreen(),
      );
    },
    ContactsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ContactsScreen(),
      );
    },
    CreateChannelRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateChannelScreen(),
      );
    },
    CreateGroupRoute.name: (routeData) {
      final args = routeData.argsAs<CreateGroupRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreateGroupScreen(
          key: args.key,
          addUsers: args.addUsers,
        ),
      );
    },
    GroupChatInfoRoute.name: (routeData) {
      final args = routeData.argsAs<GroupChatInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: GroupChatInfoScreen(
          key: args.key,
          groupModel: args.groupModel,
        ),
      );
    },
    GroupChatRoute.name: (routeData) {
      final args = routeData.argsAs<GroupChatRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: GroupChatScreen(
          key: args.key,
          groupModel: args.groupModel,
        ),
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
    UpdateGroupInfoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UpdateGroupInfoScreen(),
      );
    },
    UpdateUserDescriptionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UpdateUserDescriptionScreen(),
      );
    },
    UpdateUserEmailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UpdateUserEmailScreen(),
      );
    },
    UpdateUserNameRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UpdateUserNameScreen(),
      );
    },
    UpdateUserPhoneRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UpdateUserPhoneScreen(),
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
/// [AddUsersToChannelScreen]
class AddUsersToChannelRoute extends PageRouteInfo<AddUsersToChannelRouteArgs> {
  AddUsersToChannelRoute({
    Key? key,
    required String channelName,
    required String about,
    File? avatar,
    List<PageRouteInfo>? children,
  }) : super(
          AddUsersToChannelRoute.name,
          args: AddUsersToChannelRouteArgs(
            key: key,
            channelName: channelName,
            about: about,
            avatar: avatar,
          ),
          initialChildren: children,
        );

  static const String name = 'AddUsersToChannelRoute';

  static const PageInfo<AddUsersToChannelRouteArgs> page =
      PageInfo<AddUsersToChannelRouteArgs>(name);
}

class AddUsersToChannelRouteArgs {
  const AddUsersToChannelRouteArgs({
    this.key,
    required this.channelName,
    required this.about,
    this.avatar,
  });

  final Key? key;

  final String channelName;

  final String about;

  final File? avatar;

  @override
  String toString() {
    return 'AddUsersToChannelRouteArgs{key: $key, channelName: $channelName, about: $about, avatar: $avatar}';
  }
}

/// generated route for
/// [AddUsersToExistGroupScreen]
class AddUsersToExistGroupRoute
    extends PageRouteInfo<AddUsersToExistGroupRouteArgs> {
  AddUsersToExistGroupRoute({
    Key? key,
    required GroupListModel groupModel,
    List<PageRouteInfo>? children,
  }) : super(
          AddUsersToExistGroupRoute.name,
          args: AddUsersToExistGroupRouteArgs(
            key: key,
            groupModel: groupModel,
          ),
          initialChildren: children,
        );

  static const String name = 'AddUsersToExistGroupRoute';

  static const PageInfo<AddUsersToExistGroupRouteArgs> page =
      PageInfo<AddUsersToExistGroupRouteArgs>(name);
}

class AddUsersToExistGroupRouteArgs {
  const AddUsersToExistGroupRouteArgs({
    this.key,
    required this.groupModel,
  });

  final Key? key;

  final GroupListModel groupModel;

  @override
  String toString() {
    return 'AddUsersToExistGroupRouteArgs{key: $key, groupModel: $groupModel}';
  }
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
/// [AnotherUserInfoScreen]
class AnotherUserInfoRoute extends PageRouteInfo<AnotherUserInfoRouteArgs> {
  AnotherUserInfoRoute({
    Key? key,
    required UserListModel userModel,
    List<PageRouteInfo>? children,
  }) : super(
          AnotherUserInfoRoute.name,
          args: AnotherUserInfoRouteArgs(
            key: key,
            userModel: userModel,
          ),
          initialChildren: children,
        );

  static const String name = 'AnotherUserInfoRoute';

  static const PageInfo<AnotherUserInfoRouteArgs> page =
      PageInfo<AnotherUserInfoRouteArgs>(name);
}

class AnotherUserInfoRouteArgs {
  const AnotherUserInfoRouteArgs({
    this.key,
    required this.userModel,
  });

  final Key? key;

  final UserListModel userModel;

  @override
  String toString() {
    return 'AnotherUserInfoRouteArgs{key: $key, userModel: $userModel}';
  }
}

/// generated route for
/// [ChannelChatInfoScreen]
class ChannelChatInfoRoute extends PageRouteInfo<void> {
  const ChannelChatInfoRoute({List<PageRouteInfo>? children})
      : super(
          ChannelChatInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChannelChatInfoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChannelChatScreen]
class ChannelChatRoute extends PageRouteInfo<ChannelChatRouteArgs> {
  ChannelChatRoute({
    Key? key,
    required GroupListModel channelModel,
    List<PageRouteInfo>? children,
  }) : super(
          ChannelChatRoute.name,
          args: ChannelChatRouteArgs(
            key: key,
            channelListModel: channelModel,
          ),
          initialChildren: children,
        );

  static const String name = 'ChannelChatRoute';

  static const PageInfo<ChannelChatRouteArgs> page =
      PageInfo<ChannelChatRouteArgs>(name);
}

class ChannelChatRouteArgs {
  const ChannelChatRouteArgs({
    this.key,
    required this.channelListModel,
  });

  final Key? key;

  final GroupListModel channelListModel;

  @override
  String toString() {
    return 'ChannelChatRouteArgs{key: $key, channelListModel: $channelListModel}';
  }
}

/// generated route for
/// [ChatScreen]
class ChatRoute extends PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    Key? key,
    required UserListModel receiverUser,
    List<PageRouteInfo>? children,
  }) : super(
          ChatRoute.name,
          args: ChatRouteArgs(
            key: key,
            receiverUser: receiverUser,
          ),
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const PageInfo<ChatRouteArgs> page = PageInfo<ChatRouteArgs>(name);
}

class ChatRouteArgs {
  const ChatRouteArgs({
    this.key,
    required this.receiverUser,
  });

  final Key? key;

  final UserListModel receiverUser;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key, receiverUser: $receiverUser}';
  }
}

/// generated route for
/// [ChooseChannelTypeScreen]
class ChooseChannelTypeRoute extends PageRouteInfo<void> {
  const ChooseChannelTypeRoute({List<PageRouteInfo>? children})
      : super(
          ChooseChannelTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseChannelTypeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [CreateChannelScreen]
class CreateChannelRoute extends PageRouteInfo<void> {
  const CreateChannelRoute({List<PageRouteInfo>? children})
      : super(
          CreateChannelRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateChannelRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateGroupScreen]
class CreateGroupRoute extends PageRouteInfo<CreateGroupRouteArgs> {
  CreateGroupRoute({
    Key? key,
    required List<UserListModel> addUsers,
    List<PageRouteInfo>? children,
  }) : super(
          CreateGroupRoute.name,
          args: CreateGroupRouteArgs(
            key: key,
            addUsers: addUsers,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateGroupRoute';

  static const PageInfo<CreateGroupRouteArgs> page =
      PageInfo<CreateGroupRouteArgs>(name);
}

class CreateGroupRouteArgs {
  const CreateGroupRouteArgs({
    this.key,
    required this.addUsers,
  });

  final Key? key;

  final List<UserListModel> addUsers;

  @override
  String toString() {
    return 'CreateGroupRouteArgs{key: $key, addUsers: $addUsers}';
  }
}

/// generated route for
/// [GroupChatInfoScreen]
class GroupChatInfoRoute extends PageRouteInfo<GroupChatInfoRouteArgs> {
  GroupChatInfoRoute({
    Key? key,
    required GroupListModel groupModel,
    List<PageRouteInfo>? children,
  }) : super(
          GroupChatInfoRoute.name,
          args: GroupChatInfoRouteArgs(
            key: key,
            groupModel: groupModel,
          ),
          initialChildren: children,
        );

  static const String name = 'GroupChatInfoRoute';

  static const PageInfo<GroupChatInfoRouteArgs> page =
      PageInfo<GroupChatInfoRouteArgs>(name);
}

class GroupChatInfoRouteArgs {
  const GroupChatInfoRouteArgs({
    this.key,
    required this.groupModel,
  });

  final Key? key;

  final GroupListModel groupModel;

  @override
  String toString() {
    return 'GroupChatInfoRouteArgs{key: $key, groupModel: $groupModel}';
  }
}

/// generated route for
/// [GroupChatScreen]
class GroupChatRoute extends PageRouteInfo<GroupChatRouteArgs> {
  GroupChatRoute({
    Key? key,
    required GroupListModel groupModel,
    List<PageRouteInfo>? children,
  }) : super(
          GroupChatRoute.name,
          args: GroupChatRouteArgs(
            key: key,
            groupModel: groupModel,
          ),
          initialChildren: children,
        );

  static const String name = 'GroupChatRoute';

  static const PageInfo<GroupChatRouteArgs> page =
      PageInfo<GroupChatRouteArgs>(name);
}

class GroupChatRouteArgs {
  const GroupChatRouteArgs({
    this.key,
    required this.groupModel,
  });

  final Key? key;

  final GroupListModel groupModel;

  @override
  String toString() {
    return 'GroupChatRouteArgs{key: $key, groupModel: $groupModel}';
  }
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
/// [UpdateGroupInfoScreen]
class UpdateGroupInfoRoute extends PageRouteInfo<void> {
  const UpdateGroupInfoRoute({List<PageRouteInfo>? children})
      : super(
          UpdateGroupInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpdateGroupInfoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UpdateUserDescriptionScreen]
class UpdateUserDescriptionRoute extends PageRouteInfo<void> {
  const UpdateUserDescriptionRoute({List<PageRouteInfo>? children})
      : super(
          UpdateUserDescriptionRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpdateUserDescriptionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UpdateUserEmailScreen]
class UpdateUserEmailRoute extends PageRouteInfo<void> {
  const UpdateUserEmailRoute({List<PageRouteInfo>? children})
      : super(
          UpdateUserEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpdateUserEmailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UpdateUserNameScreen]
class UpdateUserNameRoute extends PageRouteInfo<void> {
  const UpdateUserNameRoute({List<PageRouteInfo>? children})
      : super(
          UpdateUserNameRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpdateUserNameRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UpdateUserPhoneScreen]
class UpdateUserPhoneRoute extends PageRouteInfo<void> {
  const UpdateUserPhoneRoute({List<PageRouteInfo>? children})
      : super(
          UpdateUserPhoneRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpdateUserPhoneRoute';

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
