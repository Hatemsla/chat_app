part of 'file_message_bloc.dart';

abstract class FileMessageEvent extends Equatable {}

class SendUserFileMessage extends FileMessageEvent {
  final String receiverId;
  final File file;
  final MessageType type;

  SendUserFileMessage(
      {required this.receiverId, required this.file, required this.type});

  @override
  List<Object?> get props => [receiverId, file, type];
}
