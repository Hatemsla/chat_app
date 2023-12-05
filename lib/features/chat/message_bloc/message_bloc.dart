import 'package:bloc/bloc.dart';
import 'package:chat_app/repositories/chat/abstract_chat_repository.dart';
import 'package:chat_app/repositories/chat/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageBloc(this.chatRepository) : super(MessageInitial()) {
    on<SendUserMessage>((event, emit) async {
      emit(MessageLoading(isLoading: true));
      try {
        final message = await chatRepository.sendMessage(
            event.receiverId, event.message, event.type);
        emit(MessageSentSuccces(message: message));
      } catch (e, st) {
        GetIt.I<Talker>().handle(e, st);
        emit(MessageSentFailure(exception: e));
      }

      emit(MessageLoading(isLoading: false));
    });
  }

  final AbstractChatRepository chatRepository;

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
