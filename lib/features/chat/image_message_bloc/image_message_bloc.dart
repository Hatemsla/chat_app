import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chat_app/repositories/chat/chat.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'image_message_event.dart';
part 'image_message_state.dart';

class ImageMessageBloc extends Bloc<ImageMessageEvent, ImageMessageState> {
  ImageMessageBloc(this.chatRepository) : super(ImageMessageInitial()) {
    on<SendUserImageMessage>((event, emit) async {
      emit(ImageMessageLoading(isLoading: true));
      try {
        final message =
            await chatRepository.sendImage(event.receiverId, event.image);
        emit(ImageMessageSentSuccces(message: message));
      } catch (e, st) {
        GetIt.I<Talker>().handle(e, st);
        emit(ImageMessageSentFailure(exception: e));
      }

      emit(ImageMessageLoading(isLoading: false));
    });
  }

  final AbstractChatRepository chatRepository;

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
