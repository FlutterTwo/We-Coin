import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:we_coin/common_widget/my_custom_button.dart';
import 'package:we_coin/utils/color_manager.dart';
import 'package:we_coin/view/auth/sign_up.dart';

import '../../common_widget/my_custom_textfield.dart';
import '../../utils/image_manager.dart';
import 'forgot.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'Don\'t have an account?',
              style: TextStyle(color: Colors.black, fontSize: 18),
              children: <TextSpan>[
                TextSpan(
                    text: ' SIGN UP',
                    style: TextStyle(color: Colors.blueAccent, fontSize: 18),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // navigate to desired screen
                        Get.to(SignUpScreen());
                      })
              ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 220,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                image: new AssetImage(ImageManager.splash_bar),
                fit: BoxFit.fill,
              )),
              child: SvgPicture.asset(ImageManager.app_name),
            ),
            SizedBox(height: 20.h),
            Text(
              "Login",
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 15, bottom: 30),
                    alignment: Alignment.center,
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the \nprinting and typesetting industry.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: ColorsManager.TEXT_COLOR),
                    ),
                  ),
                  MyCustomTextField(
                    hint: "Email",
                    prefixIcon: Icon(Icons.email),
                  ),
                  SizedBox(height: 20),
                  MyCustomTextField(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.password),
                    hint: "Password",
                  ),
                  SizedBox(height: 70.h),
                  MyCustomButton(
                    onPressedbtn: () {},
                    text: "Login",
                    mergin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  ),
                  InkWell(
                    onTap: () => Get.to(ForgotScreen()),
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
