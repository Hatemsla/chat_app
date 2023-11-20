import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/add_users_to_channel/add_users_to_channel.dart';
import 'package:chat_app/features/add_users_to_exist_group/add_users_to_exist_group.dart';
import 'package:chat_app/features/add_users_to_group/add_users_to_group.dart';
import 'package:chat_app/features/another_user_info/another_user_info.dart';
import 'package:chat_app/features/channel_chat/channel_chat.dart';
import 'package:chat_app/features/channel_info/channel_info.dart';
import 'package:chat_app/features/chat/chat.dart';
import 'package:chat_app/features/choose_channel_type/choose_channel_type.dart';
import 'package:chat_app/features/contacts/contacts.dart';
import 'package:chat_app/features/create_channel/create_channel.dart';
import 'package:chat_app/features/create_group/create_group.dart';
import 'package:chat_app/features/group_chat/group_chat.dart';
import 'package:chat_app/features/group_chat_info/group_chat_info.dart';
import 'package:chat_app/features/settings/settings.dart';
import 'package:chat_app/features/sign_in/sign_in.dart';
import 'package:chat_app/features/sign_up/sign_up.dart';
import 'package:chat_app/features/update_group_info/update_group_info.dart';
import 'package:chat_app/features/update_user_description/update_user_description.dart';
import 'package:chat_app/features/update_user_email/update_user_email.dart';
import 'package:chat_app/features/update_user_name/update_user_name.dart';
import 'package:chat_app/features/update_user_phone/update_user_phone.dart';
import 'package:chat_app/features/users_list/users_list.dart';
import 'package:chat_app/features/verify_user/verify_user.dart';

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
        AutoRoute(page: GroupChatRoute.page, path: '/group_chat'),
        AutoRoute(page: UpdateUserNameRoute.page, path: '/update_user_name'),
        AutoRoute(page: UpdateUserEmailRoute.page, path: '/update_user_email'),
        AutoRoute(page: UpdateUserPhoneRoute.page, path: '/update_user_phone'),
        AutoRoute(page: AnotherUserInfoRoute.page, path: '/another_user_info'),
        AutoRoute(page: CreateChannelRoute.page, path: '/create_channel'),
        AutoRoute(page: UpdateGroupInfoRoute.page, path: '/update_group_info'),
        AutoRoute(page: ChannelChatInfoRoute.page, path: '/channel_chat_info'),
        AutoRoute(page: ChannelChatRoute.page, path: '/channel_chat'),
        AutoRoute(
            page: AddUsersToExistGroupRoute.page,
            path: '/add_users_to_exist_group'),
        AutoRoute(page: GroupChatInfoRoute.page, path: '/group_chat_info'),
        AutoRoute(
            page: ChooseChannelTypeRoute.page, path: '/choose_channel_type'),
        AutoRoute(
            page: AddUsersToChannelRoute.page, path: '/add_users_to_channel'),
        AutoRoute(
            page: UpdateUserDescriptionRoute.page,
            path: '/update_user_description'),
      ];
}
