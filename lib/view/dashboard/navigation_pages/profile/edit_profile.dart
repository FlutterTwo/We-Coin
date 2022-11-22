import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:we_coin/common_widget/my_custom_button.dart';
import 'package:we_coin/common_widget/my_custom_textfield.dart';
import 'package:we_coin/utils/color_manager.dart';

import '../../../../utils/image_manager.dart';
import 'forgot_password.dart';

class EditProfilePageScreen extends StatelessWidget {
  const EditProfilePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                // background image and bottom contents
                Container(
                  color: ColorsManager.WHITE_COLOR,
                  child: Column(
                    children: <Widget>[
                      Container(
                          height: 160.0,
                          color: ColorsManager.APP_MAIN_COLOR,
                          child: Center(
                              child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.w),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.arrow_back_ios_new_rounded,
                                            color: ColorsManager.WHITE_COLOR,
                                          ),
                                          onPressed: () => Get.back(),
                                        ),
                                        Text(
                                          'Edit Profile',
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w600,
                                              color: ColorsManager.WHITE_COLOR),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.to(ForgotPasswordPageScreen());
                                          },
                                          child: CircleAvatar(
                                              child: Icon(Icons.lock_person,
                                                  color: ColorsManager
                                                      .WHITE_COLOR)),
                                        )
                                      ])))),
                      SizedBox(height: 50),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: ListView(
                            primary: false,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: MyCustomTextField(
                                    hint: "First Name",
                                    prefixIcon: Icon(Icons.person),
                                  )),
                                  SizedBox(width: 10.w),
                                  Expanded(
                                      child: MyCustomTextField(
                                    hint: "Last Name",
                                    prefixIcon: Icon(Icons.person),
                                  )),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              MyCustomTextField(
                                hint: "+91515117171",
                                prefixIcon: Icon(Icons.phone),
                              ),
                              SizedBox(height: 10.h),
                              MyCustomTextField(
                                hint: "Email",
                                prefixIcon: Icon(Icons.email_outlined),
                              ),
                              SizedBox(height: 10.h),
                              MyCustomTextField(
                                hint: "Address",
                                prefixIcon: Icon(Icons.location_on_outlined),
                              ),
                              SizedBox(height: 10.h),
                              MyCustomTextField(
                                hint: "Country",
                                prefixIcon: Icon(Icons.language_outlined),
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                children: [
                                  Expanded(
                                      child: MyCustomTextField(
                                    hint: "State",
                                    prefixIcon: Icon(Icons.map_outlined),
                                    suffixIcon:
                                        Icon(Icons.expand_more_outlined),
                                  )),
                                  SizedBox(width: 10.w),
                                  Expanded(
                                      child: MyCustomTextField(
                                    hint: "jadj",
                                    prefixIcon: Icon(Icons.apartment_outlined),
                                    suffixIcon:
                                        Icon(Icons.expand_more_outlined),
                                  )),
                                ],
                              ),
                              MyCustomButton(
                                text: "Confirm",
                                mergin: EdgeInsets.symmetric(vertical: 20.h),
                                onPressedbtn: () {},
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // Profile image
                Positioned(
                  top:
                      110.0, // (background container size) - (circle height / 2)
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(ImageManager.user_pro),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                        color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
