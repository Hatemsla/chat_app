import 'package:chat_app/repositories/auth/auth.dart';
import 'package:chat_app/repositories/users_list/abstract_users_list_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class UsersListRepository extends AbstractUsersListRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<List<UserModel>> getUsersList() async {
    var usersList = <UserModel>[];
    try {
      final users = await _db.collection("users").get();

      for (var doc in users.docs) {
        final userModel = UserModel.fromMap(doc.data());
        if (userModel.uid != _firebaseAuth.currentUser!.uid) {
          usersList.add(userModel);
        }
      }
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      throw Exception(st.toString());
    }

    return usersList;
  }
}
