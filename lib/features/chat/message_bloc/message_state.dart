part of 'message_bloc.dart';

abstract class MessageState extends Equatable {}

class MessageInitial extends MessageState {
  @override
  List<Object?> get props => [];
}

class MessageLoading extends MessageInitial {
  final bool isLoading;

  MessageLoading({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];
}

class MessageSentFailure extends MessageInitial {
  final Object? exception;

  MessageSentFailure({required this.exception});

  @override
  List<Object?> get props => [exception];
}

class MessageSentSuccces extends MessageInitial {
  final Message message;

  MessageSentSuccces({required this.message});

  @override
  List<Object?> get props => [message];
}
