import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:we_coin/utils/color_manager.dart';
import 'package:http/http.dart' as http;
import '../../../../data/model/view_profile_model.dart';
import '../../../../data/repositry/view_profile_get.dart';
import '../../../../utils/image_manager.dart';
import '../../drawer.dart';
import '../../navbar.dart';
import 'edit_profile.dart';

class ProfilePageScreen extends StatefulWidget {
  static const String routeName = '/homePage';

  @override
  State<ProfilePageScreen> createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final viewProfile =
        Provider.of<ViewProfile_Provider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final viewProfile =
        Provider.of<ViewProfile_Provider>(context, listen: false);
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
                                            Icons.arrow_back_ios,
                                            color: ColorsManager.WHITE_COLOR,
                                          ),
                                          onPressed: () =>
                                              Scaffold.of(context).openDrawer(),
                                        ),
                                        Text(
                                          'My Profile',
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w600,
                                              color: ColorsManager.WHITE_COLOR),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            viewProfile.getUser();
                                            Get.to(EditProfilePageScreen());
                                          },
                                          child: CircleAvatar(
                                              child: Icon(Icons.edit,
                                                  color: ColorsManager
                                                      .WHITE_COLOR)),
                                        )
                                      ])))),
                      SizedBox(height: 25),
                      Expanded(
                        child: FutureBuilder<ViewProfileModel?>(
                          future: viewProfile.getUser(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              ViewProfileModel? userInfo = snapshot.data;
                              if (userInfo != null) {
                                return ListView(
                                  primary: false,
                                  children: [
                                    Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            userInfo.data!.fullName.toString(),
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            userInfo.data!.email.toString(),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Container(
                                      height: 45,
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.w),
                                      alignment: Alignment.centerLeft,
                                      color: ColorsManager.COLOR_GRAY,
                                      child: Text("Personal Details"),
                                    ),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.w, vertical: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                height: 18.h,
                                                child: Text(
                                                  "Default Wallet",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: ColorsManager
                                                          .COLOR_GRAY),
                                                )),
                                            SizedBox(
                                                height: 30.h,
                                                child: Text("454a5a4s5a4da5d")),
                                            SizedBox(
                                                height: 18.h,
                                                child: Text(
                                                  "Address 1",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: ColorsManager
                                                          .COLOR_GRAY),
                                                )),
                                            SizedBox(
                                              height: 30.h,
                                              child: Text(userInfo.data!.phone
                                                          .toString() ==
                                                      null
                                                  ? "303 Talbot Ave\nCambridge, Maryland(MD), 21613"
                                                  : "303 Talbot Ave\nCambridge, Maryland(MD), 21613"),
                                            ),
                                            SizedBox(height: 18.h),
                                            /*SizedBox(
                                                height: 18.h,
                                                child: Text(
                                                  "City",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: ColorsManager
                                                          .COLOR_GRAY),
                                                )),
                                            SizedBox(
                                                height: 30.h,
                                                child: Text("New York")),*/
                                            SizedBox(
                                                height: 18.h,
                                                child: Text(
                                                  "Country",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: ColorsManager
                                                          .COLOR_GRAY),
                                                )),
                                            SizedBox(
                                                height: 30.h,
                                                child: Text(
                                                  userInfo.data!.country
                                                      .toString(),
                                                )),
                                            SizedBox(
                                                height: 18.h,
                                                child: Text(
                                                  "Phone No#",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: ColorsManager
                                                          .COLOR_GRAY),
                                                )),
                                            SizedBox(
                                                height: 30.h,
                                                child: Text(userInfo.data!.phone
                                                    .toString())),
                                            SizedBox(
                                                height: 18.h,
                                                child: Text(
                                                  "Time Zone",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: ColorsManager
                                                          .COLOR_GRAY),
                                                )),
                                            SizedBox(
                                                height: 30.h,
                                                child: Text("GMT")),
                                          ],
                                        )),
                                    Container(
                                      height: 45,
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.w),
                                      alignment: Alignment.centerLeft,
                                      color: ColorsManager.COLOR_GRAY,
                                      child: Text("Personal Details"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 80,
                                            width: 138,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                                color: ColorsManager
                                                    .COLOR_CONTAINER),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.badge),
                                                Text("Identity Card"),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Container(
                                            height: 80,
                                            width: 138,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                                color: ColorsManager
                                                    .COLOR_CONTAINER),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.badge),
                                                Text("Identity Card"),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                );
                              }
                            }
                            return Center(child: CircularProgressIndicator());
                          },
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
