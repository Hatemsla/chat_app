// import 'package:chat_app/repositories/auth/auth_repository.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'sign_in_event.dart';
// part 'sign_in_state.dart';

// class SignInBloc extends Bloc<SignInEvent, SignInState> {
//   SignInBloc() : super(SignInState()) {
//     on<SignInButtonPressedEvent>((event, emit) {});
//   }

//   final AuthRepository _authRepository;

//   Future<void> _handleSignInWithEmailAndPasswordEvent(
//       SignInButtonPressedEvent event, Emitter<SignInState> emit) async {
//     try {
//       await _authRepository.signInWithEmailAndPassword(
//           state.email, state.password);
//     } catch (e) {}
//   }
// }
