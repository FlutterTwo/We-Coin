import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:we_coin/common_widget/my_custom_button.dart';
import 'package:we_coin/view/dashboard/navigation_pages/send_money/send_money_2.dart';

import '../../../../utils/color_manager.dart';
import '../../../../utils/image_manager.dart';
import '../../drawer.dart';
import '../profile/profile_page.dart';

class SendMoneyPageScreen extends StatelessWidget {
  static const String routeName = '/profilePage';
  const SendMoneyPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: ColorsManager.APP_MAIN_COLOR,
            height: MediaQuery.of(context).size.height * 0.13,
            alignment: Alignment.center,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\$75021311",
                  style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorsManager.WHITE_COLOR),
                ),
                SizedBox(height: 5.h),
                Text(
                  "Cuurent Balance",
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorsManager.COLOR_GRAY),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text("Please Select Money"),
              SizedBox(height: 10.h),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorsManager.COLOR_GRAY),
                ),
              ),
            ],
          ),
          MyCustomButton(
            onPressedbtn: () {
              Get.to(SendMoney_2Screen());
            },
            text: "Continue",
          )
        ],
      ),
    );
  }
}
