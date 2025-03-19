import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/sharedprefrences.dart';
import '../constants/urls.dart';

class LoginService {
  final Dio dio = Dio(BaseOptions(baseUrl: baseURL));
  final String login = '/auth/login/';

  Future<String> loginWithUserName({required String password, required String number}) async {
    final result = await dio.post(
      login,
      data: {
        "username": number,
        "password": password,
      },
    );

    if (result.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(Shared.accessToken, result.data['access_token']);
      await prefs.setBool('is_authenticated', true);

      return "Success";
    } else {
      throw Exception();
    }
  }
}
