import 'dart:io';

import 'package:chat_app/repositories/group/abstract_group_repositpry.dart';
import 'package:chat_app/repositories/group/models/group_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class GroupRepository extends AbstractGroupRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  @override
  Future<GroupModel> createGroup(
      String name, File? avatar, List<String> members) async {
    String? imageUrl;
    if (avatar != null) {
      final ext = avatar.path.split('.').last;

      final ref = _storage.ref().child(
          'images/${_firebaseAuth.currentUser!.uid}/${DateTime.now().millisecondsSinceEpoch}.$ext');

      await ref
          .putFile(avatar, SettableMetadata(contentType: 'image/$ext'))
          .then((p0) {
        GetIt.I<Talker>()
            .info('Data Transferred: ${p0.bytesTransferred / 1000} kb');
      });

      imageUrl = await ref.getDownloadURL();
    }

    members.add(_firebaseAuth.currentUser!.uid);

    final groupModel = GroupModel(
        name: name,
        about: "",
        avatar: imageUrl ?? "",
        creator: _firebaseAuth.currentUser!.uid,
        isGroup: true,
        members: members);

    await _db
        .collection("groups")
        .doc(_firebaseAuth.currentUser!.uid)
        .set(groupModel.toMap());

    return groupModel;
  }
}
