import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/chat/chat.dart';
import 'package:chat_app/features/sign_in/view/view.dart';
import 'package:chat_app/features/sign_up/sign_up.dart';
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
      ];
}
