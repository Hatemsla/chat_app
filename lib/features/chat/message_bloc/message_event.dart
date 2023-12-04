part of 'message_bloc.dart';

abstract class MessageEvent extends Equatable {}

class SendUserMessage extends MessageEvent {
  final String receiverId;
  final String message;

  SendUserMessage({required this.receiverId, required this.message});

  @override
  List<Object?> get props => [];
}
