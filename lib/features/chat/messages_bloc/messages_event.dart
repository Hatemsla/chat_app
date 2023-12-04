part of 'messages_bloc.dart';

abstract class MessagesEvent extends Equatable {}

class LoadUsersMessages extends MessagesEvent {
  final String userId;
  final String otherUserId;

  LoadUsersMessages({required this.userId, required this.otherUserId});

  @override
  List<Object?> get props => [];
}
