import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

import '../../../../constants/sharedprefrences.dart';
import '../../../../models/product_model.dart';
import '../../../../constants/urls.dart';

class CartService {
  final Dio dio = Dio(BaseOptions(baseUrl: baseURL));
  final String orderUrl = '/orders/';

  Future<void> postData(List<ProductModel> dataList, DateTime orderDate) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (var element in dataList) {
      element.toJson();
    }

    try {
      dio.post(
        orderUrl,
        data: dataList,
        options: Options(
          headers: {
            "Authorization": "Bearer ${prefs.getString(Shared.accessToken)}",
          },
          contentType: 'application/json',
        ),
        queryParameters: {
          'deadline': orderDate.toIso8601String(),
        },
      );
    } catch (e) {
      log('Exception occurred while posting data: $e');
    }
    
  }
}
