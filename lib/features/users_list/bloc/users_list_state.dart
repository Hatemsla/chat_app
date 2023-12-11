part of 'users_list_bloc.dart';

abstract class ListState extends Equatable {}

class ListInitial extends ListState {
  @override
  List<Object?> get props => [];
}

class ListLoading extends ListState {
  @override
  List<Object?> get props => [];
}

class ListLoadingFailure extends ListState {
  final Object? exception;

  ListLoadingFailure({required this.exception});

  @override
  List<Object?> get props => [exception];
}

class ListLoaded extends ListState {
  ListLoaded({required this.chatsList});

  final List<ChatModel> chatsList;

  @override
  List<Object?> get props => [chatsList];
}
