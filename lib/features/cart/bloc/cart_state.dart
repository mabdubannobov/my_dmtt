part of 'cart_bloc.dart';

class CartState extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

final class CartInitial extends CartState {}

final class CreatingOrderState extends CartState {}

final class CreatedOrderState extends CartState {}

final class CreateOrderErrorState extends CartState {
  final String message;
  CreateOrderErrorState({required this.message});
}
