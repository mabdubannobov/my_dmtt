part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

final class SignInInitial extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInLoadedState extends SignInState {}

class SignInErrorState extends SignInState {
  final String message;
  SignInErrorState({required this.message});
}
