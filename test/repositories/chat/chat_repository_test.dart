import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'package:chat_app/repositories/auth/auth.dart';
import 'package:chat_app/repositories/chat/chat.dart';

void main() {
  FlutterError.onError =
      (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);

  group('ChatRepository tests', () {
    late AbstractChatRepository chatRepository;
    late AbstractAuthRepository authRepository;

    const email = 'bob@somedomain.com';
    const password = 'bob123';
    const phone = '89655820860';

    final mockUser = MockUser(
      isAnonymous: false,
      uid: 'someuid',
      email: email,
      displayName: 'Bob',
      phoneNumber: phone,
    );

    final mockAuth = MockFirebaseAuth(mockUser: mockUser);
    final mockDb = FakeFirebaseFirestore();
    final mockStorage = MockFirebaseStorage();

    setUp(() {
      authRepository = AuthRepository(firebaseAuth: mockAuth, db: mockDb);
      chatRepository = ChatRepository(
          firebaseAuth: mockAuth, db: mockDb, storage: mockStorage);
    });

    tearDown(() {});

    test('getMessages success test', () async {
      final anotherUser = await authRepository.createUserWithEmailAndPassword(
          'email@gmail.com', 'password', phone);
      final user = await authRepository.createUserWithEmailAndPassword(
          email, password, phone);

      await authRepository.signInWithEmailAndPassword(email, password);

      final sendMessage = await chatRepository.sendMessage(
          anotherUser!.uid, 'Hello, World!', MessageType.text);
      final messages =
          await chatRepository.getMessages(user!.uid, anotherUser.uid);

      expect(messages[0].message, sendMessage.message);
    });

    test('getMessages count success test', () async {
      final anotherUser = await authRepository.createUserWithEmailAndPassword(
          'email@gmail.com', 'password', phone);
      final user = await authRepository.createUserWithEmailAndPassword(
          email, password, phone);

      await authRepository.signInWithEmailAndPassword(email, password);

      const messagesCount = 5;

      for (var i = 0; i < messagesCount; i++) {
        await chatRepository.sendMessage(
            anotherUser!.uid, 'Hello, World!', MessageType.text);
      }

      final messages =
          await chatRepository.getMessages(user!.uid, anotherUser!.uid);

      expect(messages.length, messagesCount);
    });
  });
}
