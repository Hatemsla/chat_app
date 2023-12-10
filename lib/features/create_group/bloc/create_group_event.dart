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
