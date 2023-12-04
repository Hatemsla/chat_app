part of 'users_list_bloc.dart';

abstract class UsersListState extends Equatable {}

class UsersListInitial extends UsersListState {
  @override
  List<Object?> get props => [];
}

class UsersListLoading extends UsersListState {
  @override
  List<Object?> get props => [];
}

class UsersListLoadingFailure extends UsersListState {
  final Object? exception;

  UsersListLoadingFailure({required this.exception});

  @override
  List<Object?> get props => [exception];
}

class UsersListLoaded extends UsersListState {
  UsersListLoaded({required this.usersList});

  final List<UserModel> usersList;

  @override
  List<Object?> get props => [usersList];
}
