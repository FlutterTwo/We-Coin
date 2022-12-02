import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_coin/utils/api_constant.dart';
import '../model/collection_modl.dart';
import '../model/view_profile_model.dart';

class ViewProfile_Provider extends ChangeNotifier {
  Future<ViewProfileModel?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print("===> Profile ${token}");

    ViewProfileModel? user, data;
    final Dio _dio = Dio();
    try {
      Response userData =
          await _dio.get(ApiConstants.BASE_URL + ApiConstants.VIEW_PROFILE,
              options: Options(headers: {
                "authentication": "${token}",
              }));
      print('User Info: ${userData.data}');
      user = ViewProfileModel.fromJson(userData.data);

      print("kskkds${user.data!.firstName.toString()}");

      print("User === $user");
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        // print('Dio error!');
        // print('STATUS: ${e.response?.statusCode}');
        // print('DATA: ${e.response?.data}');
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
