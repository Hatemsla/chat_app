// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:chat_app/repositories/users_list/users_list.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'users_list_event.dart';
part 'users_list_state.dart';

class UsersListBloc extends Bloc<UsersListEvent, UsersListState> {
  UsersListBloc(this.usersListRepository) : super(UsersListInitial()) {
    on<LoadUsersList>((event, emit) async {
      try {
        final usersList = await usersListRepository.getUsersList();
        emit(UsersListLoaded(usersList: usersList));
      } catch (e, st) {
        emit(UsersListLoadingFailure(exception: e));
        GetIt.I<Talker>().handle(e, st);
      }
    });
  }

  final AbstractUsersListRepository usersListRepository;

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
