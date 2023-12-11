// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chat_app/repositories/chat/chat.dart';
import 'package:chat_app/repositories/group/abstract_group_repositpry.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'group_file_message_event.dart';
part 'group_file_message_state.dart';

class GroupFileMessageBloc
    extends Bloc<GroupFileMessageEvent, GroupFileMessageState> {
  GroupFileMessageBloc(this.groupRepository)
      : super(GroupFileMessageInitial()) {
    on<SendGroupFileMessage>((event, emit) async {
      emit(GroupFileMessageLoading(isLoading: true));
      try {
        if (event.type == MessageType.image) {
          final message =
              await groupRepository.sendImage(event.groupId, event.file);
          emit(GroupFileMessageSentSuccces(message: message));
        } else if (event.type == MessageType.video) {
          final message =
              await groupRepository.sendVideo(event.groupId, event.file);
          emit(GroupFileMessageSentSuccces(message: message));
        } else if (event.type == MessageType.audio) {
          final message =
              await groupRepository.sendAudio(event.groupId, event.file);
          emit(GroupFileMessageSentSuccces(message: message));
        }
      } catch (e, st) {
        GetIt.I<Talker>().handle(e, st);
        emit(GroupFileMessageSentFailure(exception: e));
      }

      emit(GroupFileMessageLoading(isLoading: false));
    });
  }

  final AbstractGroupRepository groupRepository;

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
