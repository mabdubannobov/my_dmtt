import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

import '../../../../constants/sharedprefrences.dart';
import '../../../../constants/urls.dart';

class AttendanceService {
  final Dio dio = Dio(BaseOptions(baseUrl: baseURLNew));
  final String attendanceUrl = '/api/mobile/v1/daily-attendance/';

  Future<int> getTodayCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final response = await dio.get(
        attendanceUrl,
        options: Options(
          headers: {
            "Authorization": "Bearer ${prefs.getString(Shared.accessToken)}",
          },
        ),
      );

      if (response.statusCode == 200 && response.data is List) {
        final List data = response.data;
        // Bugungi sana
        final today = DateTime.now().toIso8601String().substring(0, 10);

        final todayData = data.firstWhere(
          (item) => item["date"] == today,
          orElse: () => null,
        );

        if (todayData != null) {
          return todayData["morning_child_count"] ?? 0;
        }
      }
      return 0; // Ma'lumot topilmasa
    } catch (e) {
      log('Exception while fetching today count: $e');
      return 0;
    }
  }

  Future<void> postData(int childCount) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      await dio.post(
        attendanceUrl,
        data: {
          "morning_child_count": childCount,
          "afternoon_child_count": 0,
        },
        options: Options(
          headers: {
            "Authorization": "Bearer ${prefs.getString(Shared.accessToken)}",
          },
          contentType: 'application/json',
        ),
      );
    } catch (e) {
      log('Exception occurred while posting data: $e');
    }
  }
}
