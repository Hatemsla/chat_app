part of 'group_file_message_bloc.dart';

abstract class GroupFileMessageState extends Equatable {}

class GroupFileMessageInitial extends GroupFileMessageState {
  @override
  List<Object?> get props => [];
}

class GroupFileMessageLoading extends GroupFileMessageState {
  final bool isLoading;

  GroupFileMessageLoading({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];
}

class GroupFileMessageSentFailure extends GroupFileMessageState {
  final Object? exception;

  GroupFileMessageSentFailure({required this.exception});

  @override
  List<Object?> get props => [exception];
}

class GroupFileMessageSentSuccces extends GroupFileMessageState {
  final Message message;

  GroupFileMessageSentSuccces({required this.message});

  @override
  List<Object?> get props => [message];
}
