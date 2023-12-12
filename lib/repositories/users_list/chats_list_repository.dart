import 'package:chat_app/repositories/chat/chat.dart';
import 'package:chat_app/repositories/users_list/abstract_chats_list_repository.dart';
import 'package:chat_app/repositories/users_list/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class ChatsListRepository extends AbstractChatsListRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<List<ChatModel>> getChatsList() async {
    var chatsList = <ChatModel>[];
    try {
      final users = await _db.collection('users').get();

      for (var doc in users.docs) {
        final uid = doc['uid'];

        final ids = [_firebaseAuth.currentUser!.uid, uid];
        ids.sort();
        final chatRoomId = ids.join("_");

        final lastMessageSnapshot = await _db
            .collection('chats')
            .doc(chatRoomId)
            .collection('messages')
            .orderBy('timestamp', descending: true)
            .limit(1)
            .get();

        if (lastMessageSnapshot.docs.isNotEmpty) {
          final lastMessage =
              Message.fromMap(lastMessageSnapshot.docs.first.data());

          final userListModel = UserListModel(
            uid: uid,
            phoneNumber: doc['phoneNumber'],
            about: doc['about'],
            email: doc['email'],
            isOnline: doc['isOnline'],
            avatar: doc['avatar'],
            displayName: doc['displayName'],
            lastMessage: lastMessage.message,
            lastMessageTime: lastMessage.timestamp,
            type: lastMessage.type,
          );

          chatsList.add(userListModel);
        } else if (uid != _firebaseAuth.currentUser!.uid) {
          final userListModel = UserListModel(
            uid: uid,
            email: doc['email'],
            isOnline: doc['isOnline'],
            avatar: doc['avatar'],
            displayName: doc['displayName'],
            phoneNumber: doc['phoneNumber'],
            about: doc['about'],
          );

          chatsList.add(userListModel);
        }
      }

      final groups = await _db
          .collection('groups')
          .where('members', arrayContains: _firebaseAuth.currentUser!.uid)
          .get();

      for (var doc in groups.docs) {
        final uid = doc['uid'];

        final lastMessageSnapshot = await _db
            .collection('groups')
            .doc(uid)
            .collection('messages')
            .orderBy('timestamp', descending: true)
            .limit(1)
            .get();

        if (lastMessageSnapshot.docs.isNotEmpty) {
          final lastMessage =
              Message.fromMap(lastMessageSnapshot.docs.first.data());
          List<dynamic> members = doc['members'] ?? [];
          List<String> stringMembers =
              members.map((dynamic item) => item as String).toList();

          final groupListModel = GroupListModel(
              uid: uid,
              name: doc['name'],
              avatar: doc['avatar'],
              members: stringMembers,
              lastMessage: lastMessage.message,
              lastMessageTime: lastMessage.timestamp,
              type: lastMessage.type,
              about: doc['about'],
              creator: doc['creator'],
              isGroup: doc['isGroup']);

          chatsList.add(groupListModel);
        } else {
          List<dynamic> members = doc['members'] ?? [];
          List<String> stringMembers =
              members.map((dynamic item) => item as String).toList();

          final groupListModel = GroupListModel(
              uid: uid,
              name: doc['name'],
              avatar: doc['avatar'],
              members: stringMembers,
              lastMessage: null,
              lastMessageTime: null,
              type: null,
              about: doc['about'],
              creator: doc['creator'],
              isGroup: doc['isGroup']);

          chatsList.add(groupListModel);
        }
      }
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      throw Exception(st.toString());
    }

    return chatsList;
  }

  @override
  Future<List<UserListModel>> getUsersList() async {
    var usersList = <UserListModel>[];
    try {
      final users = await _db.collection('users').get();

      for (var doc in users.docs) {
        final uid = doc['uid'];

        final ids = [_firebaseAuth.currentUser!.uid, uid];
        ids.sort();
        final chatRoomId = ids.join("_");

        final lastMessageSnapshot = await _db
            .collection('chats')
            .doc(chatRoomId)
            .collection('messages')
            .orderBy('timestamp', descending: true)
            .limit(1)
            .get();

        if (lastMessageSnapshot.docs.isNotEmpty) {
          final lastMessage =
              Message.fromMap(lastMessageSnapshot.docs.first.data());

          final userListModel = UserListModel(
            uid: uid,
            phoneNumber: doc['phoneNumber'],
            about: doc['about'],
            email: doc['email'],
            isOnline: doc['isOnline'],
            avatar: doc['avatar'],
            displayName: doc['displayName'],
            lastMessage: lastMessage.message,
            lastMessageTime: lastMessage.timestamp,
            type: lastMessage.type,
          );

          usersList.add(userListModel);
        } else if (uid != _firebaseAuth.currentUser!.uid) {
          final userListModel = UserListModel(
            uid: uid,
            email: doc['email'],
            isOnline: doc['isOnline'],
            avatar: doc['avatar'],
            displayName: doc['displayName'],
            phoneNumber: doc['phoneNumber'],
            about: doc['about'],
          );

          usersList.add(userListModel);
        }
      }
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      throw Exception(st.toString());
    }

    return usersList;
  }

  @override
  Future<List<UserListModel>> getGroupUsersList(String groupId) async {
    var usersList = <UserListModel>[];

    try {
      final groups = await _db.collection('groups').doc(groupId).get();
      final members = List<String>.from(groups.data()!['members']);

      final QuerySnapshot usersSnapshot =
          await _db.collection('users').where('uid', whereIn: members).get();
      List<DocumentSnapshot> userDocuments = usersSnapshot.docs;

      for (var doc in userDocuments) {
        final uid = doc['uid'];

        final userListModel = UserListModel(
          uid: uid,
          phoneNumber: doc['phoneNumber'],
          about: doc['about'],
          email: doc['email'],
          isOnline: doc['isOnline'],
          avatar: doc['avatar'],
          displayName: doc['displayName'],
        );

        usersList.add(userListModel);
      }
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      throw Exception(st.toString());
    }

    return usersList;
  }

  @override
  Future<List<UserListModel>> getNotGroupUsersList(String groupId) async {
    var usersList = <UserListModel>[];

    try {
      final groups = await _db.collection('groups').doc(groupId).get();
      final members = List<String>.from(groups.data()!['members']);

      final QuerySnapshot usersSnapshot =
          await _db.collection('users').where('uid', whereNotIn: members).get();
      List<DocumentSnapshot> userDocuments = usersSnapshot.docs;

      for (var doc in userDocuments) {
        final uid = doc['uid'];

        final userListModel = UserListModel(
          uid: uid,
          phoneNumber: doc['phoneNumber'],
          about: doc['about'],
          email: doc['email'],
          isOnline: doc['isOnline'],
          avatar: doc['avatar'],
          displayName: doc['displayName'],
        );

        usersList.add(userListModel);
      }
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      throw Exception(st.toString());
    }

    return usersList;
  }
}
