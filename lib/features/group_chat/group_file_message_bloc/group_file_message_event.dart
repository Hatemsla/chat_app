part of 'group_file_message_bloc.dart';

abstract class GroupFileMessageEvent extends Equatable {}

class SendGroupFileMessage extends GroupFileMessageEvent {
  final String groupId;
  final File file;
  final MessageType type;

  SendGroupFileMessage(
      {required this.groupId, required this.file, required this.type});

  @override
  List<Object?> get props => [groupId, file, type];
}
