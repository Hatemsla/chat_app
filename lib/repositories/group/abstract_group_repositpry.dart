import 'dart:io';

import 'package:chat_app/repositories/group/models/models.dart';

abstract class AbstractGroupRepository {
  Future<GroupModel> createGroup(
      String name, File? avatar, List<String> members);
}
