import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

import '../../../../constants/sharedprefrences.dart';
import '../../../../constants/urls.dart';
import '../../../../models/order_model.dart';

class OrdersService {
  final Dio dio = Dio(BaseOptions(baseUrl: baseURL));
  final String accepted = '/orders/accepted';
  final String rejected = '/orders/rejected';
  final String pending = '/orders/pending';
  final String inProgress = '/orders/in-progress';

  List<OrderModel> acceptedOrders = [];
  List<OrderModel> rejectedOrders = [];
  List<OrderModel> pendingOrders = [];
  List<OrderModel> inProgressOrders = [];

  Future getAcceptedOrders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = await dio.get(
      accepted,
      options: Options(
        headers: {
          "Authorization": "Bearer ${prefs.getString(Shared.accessToken)}",
        },
      ),
    );

    if (result.statusCode == 200) {
      acceptedOrders = [for (final item in result.data) OrderModel.fromJson(item)];
      return acceptedOrders;
    } else {
      throw Exception();
    }
  }

  Future getInProgressOrders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = await dio.get(
      inProgress,
      options: Options(
        headers: {
          "Authorization": "Bearer ${prefs.getString(Shared.accessToken)}",
        },
      ),
    );

    if (result.statusCode == 200) {
      inProgressOrders = [for (final item in result.data) OrderModel.fromJson(item)];
      return inProgressOrders;
    } else {
      throw Exception();
    }
  }

  Future getPendingOrders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = await dio.get(
      pending,
      options: Options(
        headers: {
          "Authorization": "Bearer ${prefs.getString(Shared.accessToken)}",
        },
      ),
    );

    if (result.statusCode == 200) {
      pendingOrders = [for (final item in result.data) OrderModel.fromJson(item)];
      return pendingOrders;
    } else {
      throw Exception();
    }
  }

  Future getRejectedOrders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = await dio.get(
      rejected,
      options: Options(
        headers: {
          "Authorization": "Bearer ${prefs.getString(Shared.accessToken)}",
        },
      ),
    );

    if (result.statusCode == 200) {
      rejectedOrders = [for (final item in result.data) OrderModel.fromJson(item)];
      return rejectedOrders;
    } else {
      throw Exception();
    }
  }
}
