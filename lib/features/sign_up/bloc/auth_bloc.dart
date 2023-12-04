import 'package:chat_app/repositories/auth/auth.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AbstractAuthRepository authRepository;

  AuthBloc(
    this.authRepository,
  ) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});

    on<SignUpUser>((event, emit) async {
      emit(const AuthLoading(isLoading: true));
      try {
        final userModel = await authRepository.createUserWithEmailAndPassword(
            event.email, event.password, event.phone);

        UserPreferences.setUserModel(userModel!);

        emit(const AuthSuccess());
      } catch (e, st) {
        GetIt.I<Talker>().handle(e, st);
        emit(const AuthFailure("Sign up user failed"));
      }
      emit(const AuthLoading(isLoading: false));
    });

    on<SignInUser>((event, emit) async {
      emit(const AuthLoading(isLoading: true));
      try {
        final userModel = await authRepository.signInWithEmailAndPassword(
            event.email, event.password);

        UserPreferences.setUserModel(userModel!);

        emit(const AuthSuccess());
      } catch (e, st) {
        GetIt.I<Talker>().handle(e, st);
        emit(const AuthFailure("Sign in user failed"));
      }
      emit(const AuthLoading(isLoading: false));
    });

    on<SignOut>((event, emit) async {
      emit(const AuthLoading(isLoading: true));
      try {
        authRepository.signOutUser();

        UserPreferences.resetUserModel();

        emit(const AuthSuccess());
      } catch (e, st) {
        GetIt.I<Talker>().handle(e, st);
        emit(const AuthFailure("Cannot to sign out from account"));
      }
      emit(const AuthLoading(isLoading: false));
    });
  }
}
