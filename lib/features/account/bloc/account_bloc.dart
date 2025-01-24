import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/user_model.dart';
import '../domain/data/account_service.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final AccountService accountService = AccountService();
  AccountBloc() : super(AccountState()) {
    on<AccountEvent>((event, emit) {});
    on<GetUserDataEvent>(
      (event, emit) async {
        emit(AccountLoadingState());
        try {
          final UserModel userModel = await accountService.getUserData();
          emit(AccountLoadedState(userModel: userModel));
        } catch (e) {
          emit(AccountErrorState(message: e.toString()));
        }
      },
    );
  }
}
