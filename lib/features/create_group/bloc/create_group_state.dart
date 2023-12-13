part of 'create_group_bloc.dart';

abstract class CreateGroupState extends Equatable {}

class CreateGroupInitial extends CreateGroupState {
  @override
  List<Object?> get props => [];
}

class CreateGroupLoading extends CreateGroupState {
  @override
  List<Object?> get props => [];
}

class DeleteGroupLoading extends CreateGroupState {
  @override
  List<Object?> get props => [];
}

class CreateGroupSuccess extends CreateGroupState {
  final GroupListModel groupListModel;

  CreateGroupSuccess({required this.groupListModel});

  @override
  List<Object?> get props => [groupListModel];
}

class CreateGroupFailure extends CreateGroupState {
  final Object exception;

  CreateGroupFailure({required this.exception});

  @override
  List<Object?> get props => [exception];
}

class DeleteGroupSuccess extends CreateGroupState {
  @override
  List<Object?> get props => [];
}

class DeleteGroupFailure extends CreateGroupState {
  final Object exception;

  DeleteGroupFailure({required this.exception});

  @override
  List<Object?> get props => [exception];
}

class AddMemebersToExistGroupSuccess extends CreateGroupState {
  @override
  List<Object?> get props => [];
}

class AddMemebersToExistGroupFailure extends CreateGroupState {
  final Object exception;

  AddMemebersToExistGroupFailure({required this.exception});

  @override
  List<Object?> get props => [];
}

class RemoveUserFromGroupSuccess extends CreateGroupState {
  @override
  List<Object?> get props => [];
}

class RemoveUserFromGroupFailure extends CreateGroupState {
  final Object exception;

  RemoveUserFromGroupFailure({required this.exception});

  @override
  List<Object?> get props => [];
}
