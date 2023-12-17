import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'package:chat_app/repositories/auth/auth.dart';

void main() {
  FlutterError.onError =
      (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

  final talker = TalkerFlutter.init();

  GetIt.I.registerSingleton(talker);
  group('AuthRepository tests', () {
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

    setUp(() {
      authRepository = AuthRepository(firebaseAuth: mockAuth, db: mockDb);
    });

    tearDown(() {});

    test('createUserWithEmailAndPassword success test', () async {
      final newUser = await authRepository.createUserWithEmailAndPassword(
          email, password, phone);

      expect(newUser?.email, mockUser.email);
    });

    test('signInWithEmailAndPassword success test', () async {
      final user =
          await authRepository.signInWithEmailAndPassword(email, password);
      expect(user?.email, mockUser.email);
    });

    test('signInWithEmailAndPassword fail test', () async {
      try {
        await authRepository.signInWithEmailAndPassword(
            'random@gmail.com', 'somepassword');

        fail('Expected an error, but auth succeeded.');
      } catch (e) {
        expect(e, isA<Exception>());
      }
    });
  });
}
