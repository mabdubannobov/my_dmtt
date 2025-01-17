part of 'orders_bloc.dart';

class OrdersState extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

final class OrdersInitial extends OrdersState {}

class OrdersLoadingState extends OrdersState {}

class OrdersLoadedState extends OrdersState {
  final List<OrderModel> acceptedOrders;
  final List<OrderModel> rejectedOrders;
  final List<OrderModel> pendingOrders;
  final List<OrderModel> progressOrders;
  OrdersLoadedState({
    required this.acceptedOrders,
    required this.rejectedOrders,
    required this.pendingOrders,
    required this.progressOrders,
  });
}

class OrdersErrorState extends OrdersState {
  final String message;
  OrdersErrorState({required this.message});
}
