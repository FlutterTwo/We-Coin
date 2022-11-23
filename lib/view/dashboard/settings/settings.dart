import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:we_coin/common_widget/my_custom_textfield.dart';

import '../../../utils/color_manager.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var data = ['data1', 'data2', 'data3', 'data4', 'data5', 'data6', 'data7'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.17,
              color: ColorsManager.APP_MAIN_COLOR,
              alignment: Alignment.center,
              child: Padding(
                  padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 40.h),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () => Get.back(),
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: ColorsManager.WHITE_COLOR,
                              ),
                            ),
                            Text('Settings',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                    color: ColorsManager.WHITE_COLOR)),
                            Text(
                              "             ",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: ColorsManager.COLOR_GRAY),
                            ),
                          ]),
                      SizedBox(height: 20.h),
                    ],
                  ))),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: ExpansionTile(
                    title: const Text('Notifications'),
                    children: data.map((data) {
                      return ListTile(title: Text(data));
                    }).toList(),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: ExpansionTile(
                    title: const Text('Security'),
                    children: data.map((data) {
                      return ListTile(title: Text(data));
                    }).toList(),
                  ),
                ),
                SizedBox(height: 10),

                /// payments Settings
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: ExpansionTile(
                      title: const Text('Payment Methods'),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Name on card"),
                              SizedBox(height: 10),
                              MyCustomTextField(hint: 'John Deo'),
                              SizedBox(height: 10),
                              Text("Card number"),
                              SizedBox(height: 10),
                              MyCustomTextField(hint: 'John Deo'),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Expire date"),
                                        SizedBox(height: 10),
                                        MyCustomTextField(hint: 'MM/YY'),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Expire date"),
                                        SizedBox(height: 10),
                                        MyCustomTextField(hint: '1234'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text("Postal code"),
                              SizedBox(height: 10),
                              MyCustomTextField(hint: '2134'),
                            ],
                          ),
                        ),
                      ]),
                ),
                SizedBox(height: 10),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: ExpansionTile(
                    title: const Text('Activity'),
                    children: data.map((data) {
                      return ListTile(title: Text(data));
                    }).toList(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
