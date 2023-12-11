part of 'group_message_bloc.dart';

abstract class GroupMessageEvent extends Equatable {}

class SendGroupMessage extends GroupMessageEvent {
  final String receiverId;
  final String message;
  final MessageType type;

  SendGroupMessage(
      {required this.receiverId, required this.message, required this.type});

  @override
  List<Object?> get props => [receiverId, message, type];
}
