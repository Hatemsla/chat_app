import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chat_app/repositories/chat/chat.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'file_message_event.dart';
part 'file_message_state.dart';

class FileMessageBloc extends Bloc<FileMessageEvent, FileMessageState> {
  FileMessageBloc(this.chatRepository) : super(FileMessageInitial()) {
    on<SendUserFileMessage>((event, emit) async {
      emit(FileMessageLoading(isLoading: true));
      try {
        if (event.type == MessageType.image) {
          final message =
              await chatRepository.sendImage(event.receiverId, event.file);
          emit(FileMessageSentSuccces(message: message));
        } else if (event.type == MessageType.video) {
          final message =
              await chatRepository.sendVideo(event.receiverId, event.file);
          emit(FileMessageSentSuccces(message: message));
        } else if (event.type == MessageType.audio) {
          final message =
              await chatRepository.sendAudio(event.receiverId, event.file);
          emit(FileMessageSentSuccces(message: message));
        }
      } catch (e, st) {
        GetIt.I<Talker>().handle(e, st);
        emit(FileMessageSentFailure(exception: e));
      }

      emit(FileMessageLoading(isLoading: false));
    });
  }

  final AbstractChatRepository chatRepository;

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
