part of 'messages_bloc.dart';

abstract class MessagesState extends Equatable {}

class MessagesInitial extends MessagesState {
  @override
  List<Object?> get props => [];
}

class MessagesLoading extends MessagesState {
  @override
  List<Object?> get props => [];
}

class MessagesLoadingFailure extends MessagesState {
  final Object? exception;

  MessagesLoadingFailure({required this.exception});

  @override
  List<Object?> get props => [exception];
}

class MessagesLoaded extends MessagesState {
  final List<Message> messageList;

  MessagesLoaded({required this.messageList});

  @override
  List<Object?> get props => [messageList];
}
