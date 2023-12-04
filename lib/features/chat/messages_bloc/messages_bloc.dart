import 'package:bloc/bloc.dart';
import 'package:chat_app/repositories/chat/abstract_chat_repository.dart';
import 'package:chat_app/repositories/chat/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'messages_event.dart';
part 'messages_state.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  MessagesBloc(this.chatRepository) : super(MessagesInitial()) {
    on<LoadUsersMessages>((event, emit) async {
      try {
        final messages =
            await chatRepository.getMessages(event.userId, event.otherUserId);
        emit(MessagesLoaded(messageList: messages));
      } catch (e, st) {
        GetIt.I<Talker>().handle(e, st);
        emit(MessagesLoadingFailure(exception: e));
      }
    });
  }

  final AbstractChatRepository chatRepository;

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
