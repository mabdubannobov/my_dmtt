import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

import '../../../../constants/sharedprefrences.dart';
import '../../../../constants/urls.dart';
import '../../../../models/user_model.dart';

class AccountService {
  final Dio dio = Dio(BaseOptions(baseUrl: baseURL));
  final String getuserData = '/profile';

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
}
