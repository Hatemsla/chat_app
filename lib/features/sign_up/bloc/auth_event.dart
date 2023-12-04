part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {}

class SignUpUser extends AuthEvent {
  final String email;
  final String password;
  final String phone;

  SignUpUser(this.email, this.password, this.phone);

  @override
  List<Object> get props => [email, password, phone];
}

class SignInUser extends AuthEvent {
  final String email;
  final String password;

  SignInUser(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class SignOut extends AuthEvent {
  @override
  List<Object?> get props => [];
}
