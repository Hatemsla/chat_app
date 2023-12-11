part of 'group_messages_bloc.dart';

abstract class GroupMessagesState extends Equatable {}

class GroupMessagesInitial extends GroupMessagesState {
  @override
  List<Object?> get props => [];
}

class GroupMessagesLoading extends GroupMessagesState {
  @override
  List<Object?> get props => [];
}

class GroupMessagesLoadingFailure extends GroupMessagesState {
  final Object exception;

  GroupMessagesLoadingFailure({required this.exception});

  @override
  List<Object?> get props => [exception];
}

class GroupMessagesLoaded extends GroupMessagesState {
  final List<Message> messages;

  GroupMessagesLoaded({required this.messages});

  @override
  List<Object?> get props => [messages];
}
