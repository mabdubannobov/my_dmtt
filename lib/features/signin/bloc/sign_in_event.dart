part of 'sign_in_bloc.dart';

sealed class SignInEvent {}

class SignInEnterEvent extends SignInEvent {
  String username;
  String password;
  SignInEnterEvent(this.username, this.password);
}
