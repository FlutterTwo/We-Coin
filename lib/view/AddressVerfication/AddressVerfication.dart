import 'package:dotted_border/dotted_border.dart';
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

import '../dashboard/drawer.dart';
import '../dashboard/navbar.dart';
import '../dashboard/navigation_pages/home_page/home_page.dart';

class AddressVerficationScreen extends StatelessWidget {
  const AddressVerficationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Text(
                        "Address Verfication",
                        style: TextStyle(
                            fontSize: 24.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 0),
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the\n printing and typesetting industry.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: ColorsManager.TEXT_COLOR),
                      ),
                    ),
                    SizedBox(height: 55.h),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(vertical: 0),
                      child: Text(
                        "Upload Address Proof",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorsManager.COLOR_BLACK, fontSize: 16.sp),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    DottedBorder(
                      color: Colors.black,
                      strokeWidth: 1,
                      child: Container(
                        height: 94,
                        width: 120,
                        color: ColorsManager.COLOR_GRAY,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.file_upload_outlined,
                            ),
                            Text("Upload File")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),

          // SizedBox(height: 41.h),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyCustomButton(
                onPressedbtn: () => Get.to(MyNavigationBar()),
                text: "Submit",
                mergin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
