import 'package:chat_app/repositories/auth/auth.dart';
import 'package:chat_app/repositories/group/group.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GroupRepository tests', () {
    late AbstractAuthRepository authRepository;
    late AbstractGroupRepository groupRepository;

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
      groupRepository = GroupRepository(
          firebaseAuth: mockAuth, db: mockDb, storage: mockStorage);
    });

    tearDown(() {});

    test('createGroup success test', () async {
      final anotherUser = await authRepository.createUserWithEmailAndPassword(
          'email@gmail.com', 'password', phone);
      final user = await authRepository.createUserWithEmailAndPassword(
          email, password, phone);

      final group = await groupRepository
          .createGroup('name', null, [anotherUser!.uid, user!.uid]);

      expect(group.name, 'name');
    });

    test('createGroup memebers success test', () async {
      final anotherUser = await authRepository.createUserWithEmailAndPassword(
          'email@gmail.com', 'password', phone);
      final user = await authRepository.createUserWithEmailAndPassword(
          email, password, phone);

      final memebers = [anotherUser!.uid, user!.uid];

      final group = await groupRepository.createGroup('name', null, memebers);

      expect(group.members, memebers);
    });

    test('createChannel success test', () async {
      final anotherUser = await authRepository.createUserWithEmailAndPassword(
          'email@gmail.com', 'password', phone);
      final user = await authRepository.createUserWithEmailAndPassword(
          email, password, phone);

      final channel = await groupRepository
          .createChannel('name', null, [anotherUser!.uid, user!.uid]);

      expect(channel.name, 'name');
    });

    test('createChannel creator success test', () async {
      final anotherUser = await authRepository.createUserWithEmailAndPassword(
          'email@gmail.com', 'password', phone);
      final user = await authRepository.createUserWithEmailAndPassword(
          email, password, phone);

      final channel = await groupRepository
          .createChannel('name', null, [anotherUser!.uid, user!.uid]);

      expect(channel.creator, user.uid);
    });

    test('createChannel memebers success test', () async {
      final anotherUser = await authRepository.createUserWithEmailAndPassword(
          'email@gmail.com', 'password', phone);
      final user = await authRepository.createUserWithEmailAndPassword(
          email, password, phone);

      final memebers = [anotherUser!.uid, user!.uid];

      final group = await groupRepository.createGroup('name', null, memebers);

      expect(group.members, memebers);
    });
  });
}
