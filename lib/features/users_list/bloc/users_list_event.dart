part of 'users_list_bloc.dart';

abstract class UsersListEvent extends Equatable {}

class LoadChatsList extends UsersListEvent {
  @override
  List<Object?> get props => [];
}

class LoadUsersList extends UsersListEvent {
  @override
  List<Object?> get props => [];
}

class LoadGroupUsersList extends UsersListEvent {
  final String groupId;

  LoadGroupUsersList({required this.groupId});

  @override
  List<Object?> get props => [groupId];
}

class LoadNotGroupMembersList extends UsersListEvent {
  final String groupId;

  LoadNotGroupMembersList({required this.groupId});

  @override
  List<Object?> get props => [groupId];
}
