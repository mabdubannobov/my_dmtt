import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_dmtt/services/login_service.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final LoginService loginService = LoginService();
  SignInBloc() : super(SignInState()) {
    on<SignInEvent>((event, emit) {});
    on<SignInEnterEvent>(
      (event, emit) async {
        emit(SignInLoadingState());
        try {
          await loginService.loginWithUserName(
            password: event.password,
            number: event.username,
          );
          emit(SignInLoadedState());
        } catch (e) {
          log('Error occurred during login: $e');
          emit(SignInErrorState(message: e.toString()));
        }
      },
    );
  }
}
