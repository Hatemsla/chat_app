// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chat_app/repositories/group/abstract_group_repositpry.dart';
import 'package:chat_app/repositories/users_list/users_list.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'create_group_event.dart';
part 'create_group_state.dart';

class CreateGroupBloc extends Bloc<CreateGroupEvent, CreateGroupState> {
  CreateGroupBloc(this._groupRepository) : super(CreateGroupInitial()) {
    on<CreateGroupEvent>((event, emit) {});

    on<CreateGroup>((event, emit) async {
      emit(CreateGroupLoading(isLoading: true));
      try {
        final groupModel = await _groupRepository.createGroup(event.groupName,
            event.avatar, event.memebers.map((e) => e.uid).toList());

        final groupListModel = GroupListModel(
            uid: groupModel.uid,
            name: groupModel.name,
            members: groupModel.members,
            creator: groupModel.creator,
            avatar: groupModel.avatar,
            isGroup: groupModel.isGroup);

        emit(CreateGroupSuccess(groupListModel: groupListModel));
      } catch (e, st) {
        GetIt.I<Talker>().handle(e, st);
        emit(CreateGroupFailure(exception: e));
      }
      emit(CreateGroupLoading(isLoading: false));
    });
  }

  final AbstractGroupRepository _groupRepository;

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
