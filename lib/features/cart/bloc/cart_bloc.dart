import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bolajon_taminoti/features/cart/domain/data/cart_service.dart';

import '../../../models/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartService cartService = CartService();
  CartBloc() : super(CartState()) {
    on<CartEvent>((event, emit) {});
    on<CreateOrderEvent>(
      (event, emit) async {
        emit(CreatingOrderState());
        try {
          await cartService.postData(event.products, event.date);
          emit(CreatedOrderState());
        } catch (e) {
          emit(CreateOrderErrorState(message: e.toString()));
        }
      },
    );
  }
}
