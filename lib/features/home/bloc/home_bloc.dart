import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bolajon_taminoti/features/home/domain/data/home_service.dart';
import 'package:bolajon_taminoti/models/product_model.dart';

import '../../../models/dmtt_model.dart';
import '../../../models/user_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeService homeService = HomeService();
  HomeBloc() : super(HomeState()) {
    on<HomeEvent>((event, emit) {});
    on<GetUSerDataEvent>(
      (event, emit) async {
        emit(HomeLoadingState());
        try {
          final UserModel userModel = await homeService.getUserData();
          final DmttModel dmttModel = await homeService.getDmttName();
          final List<ProductModel> products = await homeService.getProducts();
          emit(
            HomeLoadedState(
              userModel: userModel,
              dmttModel: dmttModel,
              products: products,
            ),
          );
        } catch (e) {
          // log('Error occurred during login: $e');
          emit(HomeErrorState(message: e.toString()));
        }
      },
    );
  }
}
