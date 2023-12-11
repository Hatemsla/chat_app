part of 'group_messages_bloc.dart';

abstract class GroupMessagesEvent extends Equatable {}

class LoadGroupUsersMessages extends GroupMessagesEvent {
  final String userId;
  final String groupId;

  LoadGroupUsersMessages({required this.userId, required this.groupId});

  @override
  List<Object?> get props => [userId, groupId];
}
