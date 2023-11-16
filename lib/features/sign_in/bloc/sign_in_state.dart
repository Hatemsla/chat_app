part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {}

class SignInInitial extends SignInState {
  @override
  List<Object?> get props => [];
}

class SignInLoading extends SignInState {
  @override
  List<Object?> get props => [];
}

class SignInLoadingFailure extends SignInState {
  final Object? exception;

  SignInLoadingFailure({required this.exception});

  @override
  List<Object?> get props => [exception];
}

class SignInLoaded extends SignInState {
  @override
  List<Object?> get props => [];
}
