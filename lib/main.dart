import 'dart:async';

import 'package:chat_app/repositories/group/group.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'package:chat_app/chat_app.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/repositories/auth/abstract_auth_repository.dart';
import 'package:chat_app/repositories/auth/auth_repository.dart';
import 'package:chat_app/repositories/chat/abstract_chat_repository.dart';
import 'package:chat_app/repositories/chat/chat_repository.dart';
import 'package:chat_app/repositories/users_list/abstract_users_list_repository.dart';
import 'package:chat_app/repositories/users_list/users_list_repository.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    final talker = TalkerFlutter.init();

    GetIt.I.registerSingleton(talker);
    GetIt.I<Talker>().debug('Talker started...');

    final app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    talker.info(app.options.projectId);

    Bloc.observer = TalkerBlocObserver(
        talker: talker,
        settings: const TalkerBlocLoggerSettings(
            printStateFullData: false, printEventFullData: false));

    GetIt.I
        .registerLazySingleton<AbstractAuthRepository>(() => AuthRepository());
    GetIt.I.registerLazySingleton<AbstractUsersListRepository>(
        () => UsersListRepository());
    GetIt.I
        .registerLazySingleton<AbstractChatRepository>(() => ChatRepository());
    GetIt.I.registerLazySingleton<AbstractGroupRepository>(
        () => GroupRepository());

    FlutterError.onError =
        (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

    runApp(const ChatApp());
  }, (error, stack) => GetIt.I<Talker>().handle(error, stack));
}
