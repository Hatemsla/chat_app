part of 'group_message_bloc.dart';

abstract class GroupMessageState extends Equatable {}

class GroupMessageInitial extends GroupMessageState {
  @override
  List<Object?> get props => [];
}

class GroupMessageLoading extends GroupMessageInitial {
  final bool isLoading;

  GroupMessageLoading({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];
}

class GroupMessageSentFailure extends GroupMessageInitial {
  final Object? exception;

  GroupMessageSentFailure({required this.exception});

  @override
  List<Object?> get props => [exception];
}

class GroupMessageSentSuccces extends GroupMessageInitial {
  final Message message;

  GroupMessageSentSuccces({required this.message});

  @override
  List<Object?> get props => [message];
}
