part of 'file_message_bloc.dart';

abstract class FileMessageState extends Equatable {}

class FileMessageInitial extends FileMessageState {
  @override
  List<Object?> get props => [];
}

class FileMessageLoading extends FileMessageState {
  final bool isLoading;

  FileMessageLoading({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];
}

class FileMessageSentFailure extends FileMessageState {
  final Object? exception;

  FileMessageSentFailure({required this.exception});

  @override
  List<Object?> get props => [exception];
}

class FileMessageSentSuccces extends FileMessageState {
  final Message message;

  FileMessageSentSuccces({required this.message});

  @override
  List<Object?> get props => [message];
}
