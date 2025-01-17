import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../models/order_model.dart';
import '../../domain/data/orders_service.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final OrdersService apiService = OrdersService();
  OrdersBloc() : super(OrdersState()) {
    on<OrdersEvent>((event, emit) {});
    on<GetOrdersDataEvent>(
      (event, emit) async {
        emit(OrdersLoadingState());
        try {
          final List<OrderModel> acceptedOrders = await apiService.getAcceptedOrders();
          final List<OrderModel> rejectedOrders = await apiService.getRejectedOrders();
          final List<OrderModel> progressOrders = await apiService.getInProgressOrders();
          final List<OrderModel> pendingOrders = await apiService.getPendingOrders();
          emit(
            OrdersLoadedState(
              acceptedOrders: acceptedOrders,
              rejectedOrders: rejectedOrders,
              pendingOrders: pendingOrders,
              progressOrders: progressOrders,
            ),
          );
        } catch (e) {
          // log('Error occurred during login: $e');
          emit(OrdersErrorState(message: e.toString()));
        }
      },
    );
  }
}
