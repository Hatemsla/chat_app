part of 'message_bloc.dart';

abstract class MessageEvent extends Equatable {}

class SendUserMessage extends MessageEvent {
  final String receiverId;
  final String message;
  final MessageType type;

  SendUserMessage(
      {required this.receiverId, required this.message, required this.type});

  @override
  List<Object?> get props => [receiverId, message, type];
}
