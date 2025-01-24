part of 'account_bloc.dart';

class AccountState extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

final class AccountInitial extends AccountState {}

class AccountLoadingState extends AccountState {}

class AccountLoadedState extends AccountState {
  final UserModel userModel;
  AccountLoadedState({required this.userModel});
}

class AccountUpdateSuccessState extends AccountState {}

class AccountErrorState extends AccountState {
  final String message;
  AccountErrorState({required this.message});
}
