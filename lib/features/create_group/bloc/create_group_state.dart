part of 'create_group_bloc.dart';

abstract class CreateGroupState extends Equatable {}

class CreateGroupInitial extends CreateGroupState {
  @override
  List<Object?> get props => [];
}

class CreateGroupLoading extends CreateGroupState {
  final bool isLoading;

  CreateGroupLoading({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];
}

class CreateGroupSuccess extends CreateGroupState {
  final GroupModel groupModel;

  CreateGroupSuccess({required this.groupModel});

  @override
  List<Object?> get props => [groupModel];
}

class CreateGroupFailure extends CreateGroupState {
  final Object exception;

  CreateGroupFailure({required this.exception});

  @override
  List<Object?> get props => [exception];
}
