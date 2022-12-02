import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_coin/utils/api_constant.dart';

import '../model/setting_notification_model.dart';

class SettingsProvider extends ChangeNotifier {
  Future<setting_notification_model?> getNotification() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print("===> Profile ${token}");

    setting_notification_model? user;
    final Dio _dio = Dio();
    try {
      Response userData = await _dio.get(
          ApiConstants.BASE_URL + ApiConstants.SETTING_NOTIFICATION,
          options: Options(headers: {
            "authentication": "${token}",
          }));
      print('User Info: ${userData.data}');
      user = setting_notification_model.fromJson(userData.data);

      print("User === $user");
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return user;
  }
}
