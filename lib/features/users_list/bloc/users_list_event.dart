part of 'users_list_bloc.dart';

abstract class UsersListEvent extends Equatable {}

class LoadUsersList extends UsersListEvent {
  @override
  List<Object?> get props => [];
}
