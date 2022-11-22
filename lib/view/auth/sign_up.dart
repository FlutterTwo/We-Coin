import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:we_coin/common_widget/my_custom_button.dart';
import 'package:we_coin/utils/color_manager.dart';
import 'package:we_coin/view/auth/login.dart';

import '../../common_widget/my_custom_textfield.dart';
import '../../utils/image_manager.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'Already have account?',
              style: TextStyle(color: Colors.black, fontSize: 18),
              children: <TextSpan>[
                TextSpan(
                    text: ' SIGN IN',
                    style: TextStyle(color: Colors.blueAccent, fontSize: 18),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // navigate to desired screen
                        Get.to(LoginScreen());
                      })
              ]),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Text(
              "Create new account",
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 40),
              alignment: Alignment.center,
              child: Text(
                "Lorem Ipsum is simply dummy text of the \nprinting and typesetting industry.",
                textAlign: TextAlign.center,
                style: TextStyle(color: ColorsManager.TEXT_COLOR),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  MyCustomTextField(
                    hint: "Email",
                    prefixIcon: Icon(Icons.email),
                  ),
                  SizedBox(height: 25),
                  MyCustomTextField(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.password),
                    hint: "Password",
                  ),
                  SizedBox(height: 25),
                  MyCustomTextField(
                    prefixIcon: Icon(Icons.phone),
                    hint: "+91515117171",
                  ),
                  SizedBox(height: 25),
                  MyCustomTextField(
                    prefixIcon: Icon(Icons.location_on_outlined),
                    hint: "Address",
                  ),
                  SizedBox(height: 25),
                  MyCustomTextField(
                    suffixIcon: Icon(Icons.expand_more_outlined),
                    prefixIcon: Icon(Icons.language_outlined),
                    hint: "Country",
                  ),
                  SizedBox(height: 25),
                  Row(
                    children: [
                      Expanded(
                        child: MyCustomTextField(
                          suffixIcon: Icon(Icons.expand_more_outlined),
                          prefixIcon: Icon(Icons.language_outlined),
                          hint: "State",
                        ),
                      ),
                      SizedBox(width: 25),
                      Expanded(
                        child: MyCustomTextField(
                          suffixIcon: Icon(Icons.expand_more_outlined),
                          prefixIcon: Icon(Icons.language_outlined),
                          hint: "City",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25.h),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Captcha",
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.h),
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      ImageManager.catptcha,
                      height: 35,
                    ),
                  ),
                  SizedBox(height: 25.h),
                  MyCustomTextField(
                    hint: "Type the text displayed here",
                  ),
                  SizedBox(height: 70.h),
                  MyCustomButton(
                    onPressedbtn: () {},
                    text: "Login",
                    mergin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
