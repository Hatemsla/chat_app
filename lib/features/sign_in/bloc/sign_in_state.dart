// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:equatable/equatable.dart';

// part of 'sign_in_bloc.dart';

// enum SignInStatus{
//   success,
//   failure,
//   loading
// }

// class SignInState extends Equatable {
//   const SignInState({required this.message, required this.status, required this.email, required this.password});
  
//   final String message;
//   final SignInStatus status;
//   final String email;
//   final String password;

//   SignInState copyWith({
//     String? message,
//     SignInStatus? status,
//     String? email,
//     String? password,
//   }) {
//     return SignInState(
//       message: message ?? this.message,
//       status: status ?? this.status,
//       email: email ?? this.email,
//       password: password ?? this.password,
//     );
//   }

//   @override
//   List<Object> get props => [message, status, email, password];
// }


