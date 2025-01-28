part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CreateOrderEvent extends CartEvent {
  final List<ProductModel> products;
  final DateTime date;
  const CreateOrderEvent({
    required this.products,
    required this.date,
  });
}
