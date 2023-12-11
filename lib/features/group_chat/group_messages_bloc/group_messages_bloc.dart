// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:chat_app/repositories/group/abstract_group_repositpry.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'package:chat_app/repositories/chat/chat.dart';

part 'group_messages_event.dart';
part 'group_messages_state.dart';

class GroupMessagesBloc extends Bloc<GroupMessagesEvent, GroupMessagesState> {
  GroupMessagesBloc(this.groupRepository) : super(GroupMessagesInitial()) {
    on<LoadGroupUsersMessages>((event, emit) async {
      try {
        final messages =
            await groupRepository.getMessages(event.userId, event.groupId);
        emit(GroupMessagesLoaded(messages: messages));
      } catch (e, st) {
        GetIt.I<Talker>().handle(e, st);
        emit(GroupMessagesLoadingFailure(exception: e));
      }
    });
  }

  final AbstractGroupRepository groupRepository;

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
