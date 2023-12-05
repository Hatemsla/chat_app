part of 'image_message_bloc.dart';

abstract class ImageMessageEvent extends Equatable {}

class SendUserImageMessage extends ImageMessageEvent {
  final String receiverId;
  final File image;
  final MessageType type;

  SendUserImageMessage(
      {required this.receiverId, required this.image, required this.type});

  @override
  List<Object?> get props => [receiverId, image, type];
}
