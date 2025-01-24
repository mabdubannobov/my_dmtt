part of 'account_bloc.dart';

sealed class AccountEvent extends Equatable {
  const AccountEvent();
  @override
  List<Object> get props => [];
}

class GetUserDataEvent extends AccountEvent {}

class UpdateUserDataEvent extends AccountEvent {
  final UserModel userData;
  const UpdateUserDataEvent({required this.userData});
}
