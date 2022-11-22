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
import 'otp_verifiy.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  height: 249,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                    image: new AssetImage(ImageManager.splash_bar),
                    fit: BoxFit.fill,
                  )),
                  child: SvgPicture.asset(ImageManager.app_name),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Forget Password",
                        style: TextStyle(
                            fontSize: 24.sp, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 8, bottom: 10),
                        child: Text(
                          "Enter phone number to reset password",
                          style: TextStyle(color: ColorsManager.TEXT_COLOR),
                        ),
                      ),
                      SizedBox(height: 55.h),
                      MyCustomTextField(
                        kry: TextInputType.phone,
                        prefixIcon: Icon(Icons.phone),
                        hint: "Phone Number",
                      ),
                      SizedBox(height: 70.h),
                    ],
                  ),
                ),
              ],
            ),

            // SizedBox(height: 41.h),

            MyCustomButton(
              onPressedbtn: () {
                Get.to(OtpVerificationScreen());
              },
              text: "Confirm",
              mergin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
            ),
          ],
        ),
      ),
    );
  }
}
