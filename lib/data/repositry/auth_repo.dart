import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get/get_connect/http/src/http.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_coin/view/auth/login.dart';

import '../../utils/api_constant.dart';
import '../../view/dashboard/drawer.dart';
import '../../view/dashboard/navbar.dart';

///////////////////////////////////////////////////////////////////////
class Auth_Provider extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  ////////////
  Future sign_up(BuildContext context, String full_name, String email,
      String password, String phone, String country) async {
    print('working');
    http.Response response = await http.post(
        Uri.parse(ApiConstants.BASE_URL + ApiConstants.SIGN_UP),
        headers: {
          'authentication': '@',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: {
          "full_name": full_name,
          "email": email,
          "phone": phone,
          "password": password,
          "country": country,
        });
    print(response.statusCode);
    Map<String, dynamic> data = jsonDecode(response.body);
    String success = data["status"].toString();
    if (success == "success") {
      print('done');
      Progress(
        context,
        Text(
          "You are successfully register in",
          textAlign: TextAlign.center,
        ),
        Colors.green,
      );
      Get.to(LoginScreen());
    } else {
      print("Sorry we have an error");
      print(response.statusCode);
      Progress(
        context,
        Text(data["message"]),
        Colors.red,
      );
    }
    return response.body;
  }

  //// sign in part
  Future sign_in(BuildContext context, String email, String password) async {
    print('working');
    http.Response response = await http.post(
        Uri.parse(ApiConstants.BASE_URL + ApiConstants.SIGN_IN),
        headers: {
          'authentication': '@',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: {
          "email": email,
          "password": password,
        });
    print(response.statusCode);
    Map<String, dynamic> data = jsonDecode(response.body);
    String success = data["status"].toString();
    Map<String, dynamic> data2 = jsonDecode(response.body)['data'];
    Map<String, dynamic> data3 = jsonDecode(response.body)['data']['user'];

    String success3 = data2["authentication"];

    SharedPreferences prefs = await SharedPreferences.getInstance();
    //now set the token inside the shared_preferences
    //I assumed that the token is a field in the json response, but check it before!!
    await prefs.setString('token', success3);

    print("AuthStore=> ${prefs.getString('token')}");
    if (success == "success") {
      int meesg = data3["id"];
      await prefs.setInt('id', meesg);
      print('Auth ID: ${prefs.getInt('id')}');
      Progress(
        context,
        Text("You are successfully Login in"),
        Colors.green,
      );
      Get.to(Dashboard());
    } else {
      print("Sorry we have an error");
      print(response.statusCode);
      Progress(context, Text(data["message"]), Colors.red);
    }
    return response.body;
  }

  //// forgot password in part
  Future forgot_password(BuildContext context, String phone) async {
    print('working');
    http.Response response = await http.post(
        Uri.parse(ApiConstants.BASE_URL + ApiConstants.SIGN_IN),
        headers: {
          'authentication': '@',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: {
          "phone": phone,
        });
    print(response.statusCode);
    Map<String, dynamic> data = jsonDecode(response.body);
    String success = data["status"].toString();
    if (success == "success") {
      print('done');
      Get.to(LoginScreen());
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
