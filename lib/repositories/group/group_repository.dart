import 'dart:io';

import 'package:chat_app/repositories/chat/models/message_model.dart';
import 'package:chat_app/repositories/group/abstract_group_repositpry.dart';
import 'package:chat_app/repositories/group/models/group_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:uuid/uuid.dart';

class GroupRepository extends AbstractGroupRepository {
  final FirebaseFirestore _db;
  final FirebaseAuth _firebaseAuth;
  final FirebaseStorage _storage;

  GroupRepository(
      {required FirebaseFirestore db,
      required FirebaseAuth firebaseAuth,
      required FirebaseStorage storage})
      : _db = db,
        _firebaseAuth = firebaseAuth,
        _storage = storage;

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
        uid: const Uuid().v4(),
        name: name,
        about: null,
        avatar: imageUrl,
        creator: _firebaseAuth.currentUser!.uid,
        isGroup: true,
        members: members);

    await _db.collection("groups").doc(groupModel.uid).set(groupModel.toMap());

    return groupModel;
  }

  @override
  Future<GroupModel> createChannel(
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
        uid: const Uuid().v4(),
        name: name,
        about: null,
        avatar: imageUrl,
        creator: _firebaseAuth.currentUser!.uid,
        isGroup: false,
        members: members);

    await _db.collection("groups").doc(groupModel.uid).set(groupModel.toMap());

    return groupModel;
  }

  @override
  Future<List<Message>> getMessages(String userId, String groupId) async {
    var messageList = <Message>[];

    try {
      final messages = await _db
          .collection("groups")
          .doc(groupId)
          .collection("messages")
          .orderBy('timestamp', descending: false)
          .get();

      for (var doc in messages.docs) {
        messageList.add(Message.fromMap(doc.data()));
      }
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      throw Exception(e);
    }

    return messageList;
  }

  @override
  Future<Message> sendAudio(String groupId, File file) async {
    try {
      final ext = file.path.split('.').last;

      final ref = _storage.ref().child(
          'audios/${_firebaseAuth.currentUser!.uid}/${DateTime.now().millisecondsSinceEpoch}.$ext');

      await ref
          .putFile(file, SettableMetadata(contentType: 'audio/$ext'))
          .then((p0) {
        GetIt.I<Talker>()
            .info('Data Transferred: ${p0.bytesTransferred / 1000} kb');
      });

      final audioUrl = await ref.getDownloadURL();
      final msg = await sendMessage(groupId, audioUrl, MessageType.audio);

      return msg;
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      throw Exception(st);
    }
  }

  @override
  Future<Message> sendImage(String groupId, File file) async {
    try {
      final ext = file.path.split('.').last;

      final ref = _storage.ref().child(
          'images/${_firebaseAuth.currentUser!.uid}/${DateTime.now().millisecondsSinceEpoch}.$ext');

      await ref
          .putFile(file, SettableMetadata(contentType: 'image/$ext'))
          .then((p0) {
        GetIt.I<Talker>()
            .info('Data Transferred: ${p0.bytesTransferred / 1000} kb');
      });

      final imageUrl = await ref.getDownloadURL();
      final msg = await sendMessage(groupId, imageUrl, MessageType.image);

      return msg;
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      throw Exception(st);
    }
  }

  @override
  Future<Message> sendMessage(
      String groupId, String message, MessageType type) async {
    try {
      final String currentUserUid = _firebaseAuth.currentUser!.uid;
      final String currentUserEmail =
          _firebaseAuth.currentUser!.email.toString();
      final Timestamp timestamp = Timestamp.now();

      final newMessage = Message(
          senderId: currentUserUid,
          senderEmail: currentUserEmail,
          receiverId: groupId,
          message: message,
          timestamp: timestamp,
          type: type);

      await _db
          .collection("groups")
          .doc(groupId)
          .collection("messages")
          .add(newMessage.toMap());

      return newMessage;
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      throw Exception(st);
    }
  }

  @override
  Future<Message> sendVideo(String groupId, File file) async {
    try {
      final ext = file.path.split('.').last;

      final ref = _storage.ref().child(
          'videos/${_firebaseAuth.currentUser!.uid}/${DateTime.now().millisecondsSinceEpoch}.$ext');

      await ref
          .putFile(file, SettableMetadata(contentType: 'video/$ext'))
          .then((p0) {
        GetIt.I<Talker>()
            .info('Data Transferred: ${p0.bytesTransferred / 1000} kb');
      });

      final videoUrl = await ref.getDownloadURL();
      final msg = await sendMessage(groupId, videoUrl, MessageType.video);

      return msg;
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      throw Exception(st);
    }
  }

  @override
  Future<void> addMembersToExistGroup(
      String groupId, List<String> newMembers) async {
    try {
      final group = await _db.collection('groups').doc(groupId).get();
      var currentMembers = List<String>.from(group['members'] ?? []);

      currentMembers.addAll(newMembers);

      await _db.collection('groups').doc(groupId).update({
        'members': currentMembers,
      });
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      throw Exception(st);
    }
  }

  @override
  Future<void> deleteGroup(String groupId) async {
    try {
      await _db.collection('groups').doc(groupId).delete();
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      throw Exception(st);
    }
  }

  @override
  Future<void> removeUserFromGroup(String groupId, String userId) async {
    try {
      await _db.collection('groups').doc(groupId).update({
        'members': FieldValue.arrayRemove([userId])
      });
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
      throw Exception(st);
    }
  }
}
