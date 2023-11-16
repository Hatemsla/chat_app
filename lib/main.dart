import 'dart:async';

import 'package:chat_app/chat_app.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

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

    FlutterError.onError =
        (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

    runApp(const ChatApp());
  }, (error, stack) => GetIt.I<Talker>().handle(error, stack));
}
