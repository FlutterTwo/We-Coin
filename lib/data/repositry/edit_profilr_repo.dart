import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/api_constant.dart';
import '../../view/dashboard/navbar.dart';

///////////////////////////////////////////////////////////////////////
class EditProfile_Provider extends ChangeNotifier {
  Future editeProfile(BuildContext context, String full_name, String email,
      String password, String old_password, String country) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print("===> Profile ${token}");
    print('working');
    http.Response response = await http.post(
        Uri.parse(ApiConstants.BASE_URL + ApiConstants.EDIT_PROFILE),
        headers: {
          HttpHeaders.authorizationHeader: '',
          'authentication': "$token",
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: {
          "full_name": full_name,
          "email": email,
          "password": password,
          "old_password": old_password,
          "country": country,
        });
    print("====Response ${response}");

    print(response.statusCode);
    Map<String, dynamic> data = jsonDecode(response.body);
    String success = data["statusCode"].toString();
    if (success == "208") {
      Get.to(MyNavigationBar());
      print('done');
      Progress(context, Text(data["message"]), Colors.green);
    } else {
      print("Sorry we have an error");
      print(response.statusCode);
      Progress(context, Text(data["message"]), Colors.red);
    }
    return response.body;
  }
}

Saveuserid(String id) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('userid', id);
}

Progress(BuildContext context, Widget widget, Color color) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: color,
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      width: MediaQuery.of(context).size.width * 0.90,
      content: widget));
}
