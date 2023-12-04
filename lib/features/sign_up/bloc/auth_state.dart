part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {
  final bool isLoading;

  const AuthLoading({required this.isLoading});
}

class AuthSuccess extends AuthState {
  const AuthSuccess({this.user});

  final UserModel? user;
}

class AuthFailure extends AuthState {
  const AuthFailure(this.error);

  final Object error;

  @override
  List<Object> get props => [error];
}
