import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

import '../../../../constants/sharedprefrences.dart';
import '../../../../constants/urls.dart';
import '../../../../models/dmtt_model.dart';
import '../../../../models/product_model.dart';
import '../../../../models/user_model.dart';

class HomeService {
  final Dio dio = Dio(BaseOptions(baseUrl: baseURL));
  final String getuserData = '/profile';
  final String getDMTTName = '/users/dmtt';
  final String orderUrl = '/orders/';
  final String productsUrl = '/limit';

  // Future<void> postData(List<ProductModel> dataList) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   for (var element in dataList) {
  //     element.toJson();
  //   }

  //   try {
  //     dio.post(
  //       orderUrl,
  //       data: dataList,
  //       options: Options(
  //         headers: {
  //           "Authorization": "Bearer ${prefs.getString(Shared.accessToken)}",
  //         },
  //         contentType: 'application/json',
  //       ),
  //     );
  //   } catch (e) {
  //     log('Exception occurred while posting data: $e');
  //   }
  // }

  Future<UserModel> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = await dio.get(
      getuserData,
      options: Options(
        headers: {
          "Authorization": "Bearer ${prefs.getString(Shared.accessToken)}",
        },
      ),
    );

    if (result.statusCode == 200) {
      final Map data = result.data;
      return UserModel(
        firstName: data['first_name'],
        lastName: data['last_name'],
        district: data['district'],
        imageUrl: data['image_url'],
      );
    } else {
      throw Exception();
    }
  }

  Future<DmttModel> getDmttName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = await dio.get(
      getDMTTName,
      options: Options(
        headers: {
          "Authorization": "Bearer ${prefs.getString(Shared.accessToken)}",
        },
      ),
    );

    if (result.statusCode == 200) {
      final Map data = result.data;
      return DmttModel(
        name: data['name'],
      );
    } else {
      throw Exception();
    }
  }

  Future<List<ProductModel>> getProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = await dio.get(
      "$productsUrl?company_id=2",
      options: Options(
        headers: {
          "Authorization": "Bearer ${prefs.getString(Shared.accessToken)}",
        },
      ),
    );

    if (result.statusCode == 200) {
      List<ProductModel> allProducts;

      allProducts = [for (final item in result.data) ProductModel.fromJson(item)];
      return allProducts;
    } else {
      throw Exception();
    }
  }
}
