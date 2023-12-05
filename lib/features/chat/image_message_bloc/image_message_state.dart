part of 'image_message_bloc.dart';

abstract class ImageMessageState extends Equatable {}

class ImageMessageInitial extends ImageMessageState {
  @override
  List<Object?> get props => [];
}

class ImageMessageLoading extends ImageMessageState {
  final bool isLoading;

  ImageMessageLoading({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];
}

class ImageMessageSentFailure extends ImageMessageState {
  final Object? exception;

  ImageMessageSentFailure({required this.exception});

  @override
  List<Object?> get props => [exception];
}

class ImageMessageSentSuccces extends ImageMessageState {
  final Message message;

  ImageMessageSentSuccces({required this.message});

  @override
  List<Object?> get props => [message];
}
