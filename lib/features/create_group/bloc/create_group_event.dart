part of 'create_group_bloc.dart';

abstract class CreateGroupEvent extends Equatable {}

class CreateGroup extends CreateGroupEvent {
  final String groupName;
  final File? avatar;
  final List<UserListModel> memebers;

  CreateGroup(
      {required this.groupName, required this.avatar, required this.memebers});

  @override
  List<Object?> get props => [groupName, avatar, memebers];
}

class CreateChannel extends CreateGroupEvent {
  final String channelName;
  final String about;
  final File? avatar;
  final List<UserListModel> memebers;

  CreateChannel(
      {required this.channelName,
      required this.about,
      required this.avatar,
      required this.memebers});

  @override
  List<Object?> get props => [channelName, about, avatar, memebers];
}

class AddMemebersToExistGroup extends CreateGroupEvent {
  final String groupId;
  final List<UserListModel> newMemebers;

  AddMemebersToExistGroup({required this.groupId, required this.newMemebers});

  @override
  List<Object?> get props => [groupId, newMemebers];
}
