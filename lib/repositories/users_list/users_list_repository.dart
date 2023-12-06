import 'package:chat_app/repositories/chat/chat.dart';
import 'package:chat_app/repositories/users_list/abstract_users_list_repository.dart';
import 'package:chat_app/repositories/users_list/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class UsersListRepository extends AbstractUsersListRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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
}
