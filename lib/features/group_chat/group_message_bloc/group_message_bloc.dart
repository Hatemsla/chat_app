import 'package:bloc/bloc.dart';
import 'package:chat_app/repositories/chat/models/models.dart';
import 'package:chat_app/repositories/group/group.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'group_message_event.dart';
part 'group_message_state.dart';

class GroupMessageBloc extends Bloc<GroupMessageEvent, GroupMessageState> {
  GroupMessageBloc(this.groupRepository) : super(GroupMessageInitial()) {
    on<SendGroupMessage>((event, emit) async {
      emit(GroupMessageLoading(isLoading: true));
      try {
        final message = await groupRepository.sendMessage(
            event.receiverId, event.message, event.type);
        emit(GroupMessageSentSuccces(message: message));
      } catch (e, st) {
        GetIt.I<Talker>().handle(e, st);
        emit(GroupMessageSentFailure(exception: e));
      }

      emit(GroupMessageLoading(isLoading: false));
    });
  }

  final AbstractGroupRepository groupRepository;

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
