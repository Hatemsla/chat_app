// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:chat_app/repositories/users_list/users_list.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'users_list_event.dart';
part 'users_list_state.dart';

class UsersListBloc extends Bloc<UsersListEvent, ListState> {
  UsersListBloc(this.chatsListRepository) : super(ListInitial()) {
    on<LoadChatsList>((event, emit) async {
      try {
        final chatsList = await chatsListRepository.getChatsList();
        emit(ListLoaded(chatsList: chatsList));
      } catch (e, st) {
        emit(ListLoadingFailure(exception: e));
        GetIt.I<Talker>().handle(e, st);
      }
    });

    on<LoadUsersList>((event, emit) async {
      try {
        final usersList = await chatsListRepository.getUsersList();
        emit(ListLoaded(chatsList: usersList));
      } catch (e, st) {
        emit(ListLoadingFailure(exception: e));
        GetIt.I<Talker>().handle(e, st);
      }
    });

    on<LoadGroupUsersList>((event, emit) async {
      try {
        final usersList =
            await chatsListRepository.getGroupUsersList(event.groupId);
        emit(ListLoaded(chatsList: usersList));
      } catch (e, st) {
        emit(ListLoadingFailure(exception: e));
        GetIt.I<Talker>().handle(e, st);
      }
    });
  }

  final AbstractChatsListRepository chatsListRepository;

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
