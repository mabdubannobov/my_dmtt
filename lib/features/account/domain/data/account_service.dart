import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

import '../../../../constants/sharedprefrences.dart';
import '../../../../constants/urls.dart';
import '../../../../models/user_model.dart';

class AccountService {
  final Dio dio = Dio(BaseOptions(baseUrl: baseURL));
  final String userDataUrl = '/profile';

  Future<UserModel> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = await dio.get(
      userDataUrl,
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
        phoneNumber: data['phone_number'],
      );
    } else {
      throw Exception();
    }
  }

  Future<bool> updateUserData(UserModel userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      Response response = await dio.put(
        userDataUrl,
        data: userData.toJson(),
        options: Options(
          headers: {
            "Authorization": "Bearer ${prefs.getString(Shared.accessToken)}",
          },
          contentType: 'application/json',
        ),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log('Exception occurred while posting data: $e');
      return false;
    }
  }
}
