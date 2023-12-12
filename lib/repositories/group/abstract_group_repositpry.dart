import 'dart:io';

import 'package:chat_app/repositories/chat/chat.dart';
import 'package:chat_app/repositories/group/models/models.dart';

abstract class AbstractGroupRepository {
  Future<List<Message>> getMessages(String userId, String groupId);
  Future<GroupModel> createGroup(
      String name, File? avatar, List<String> members);
  Future<GroupModel> createChannel(
      String name, File? avatar, List<String> members);
  Future<void> addMembersToExistGroup(String groupId, List<String> newMembers);
  Future<Message> sendMessage(String groupId, String message, MessageType type);
  Future<Message> sendImage(String groupId, File file);
  Future<Message> sendVideo(String groupId, File file);
  Future<Message> sendAudio(String groupId, File file);
}
