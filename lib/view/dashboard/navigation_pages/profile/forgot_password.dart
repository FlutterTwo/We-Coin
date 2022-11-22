import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:we_coin/common_widget/my_custom_button.dart';
import 'package:we_coin/common_widget/my_custom_textfield.dart';
import 'package:we_coin/utils/color_manager.dart';

class ForgotPasswordPageScreen extends StatelessWidget {
  const ForgotPasswordPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.APP_MAIN_COLOR,
        toolbarHeight: 118,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backwardsCompatibility: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Get.back(),
        ),
        title: Text("Update Password"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 40.h),
        child: Column(
          children: [
            MyCustomTextField(hint: "Current Password"),
            SizedBox(height: 15.h),
            MyCustomTextField(hint: "New Password"),
            SizedBox(height: 15.h),
            MyCustomTextField(hint: "Confirm Password"),
            SizedBox(height: 130.h),
            MyCustomButton(
              mergin: EdgeInsets.zero,
              onPressedbtn: () {},
              text: "Update Now",
            )
          ],
        ),
      ),
    );
  }
}
