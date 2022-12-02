import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getwidget/components/checkbox/gf_checkbox.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';
import 'package:provider/provider.dart';
import 'package:we_coin/common_widget/my_custom_button.dart';
import 'package:we_coin/common_widget/my_custom_textfield.dart';

import '../../../data/model/setting_notification_model.dart';
import '../../../data/repositry/settings_repo.dart';
import '../../../utils/color_manager.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isChecked = false;
  var data = [
    'I receive marketing options for my account',
    'I send or receive crypto',
    'I receive merchant orders',
    'There are recommended actions for my account'
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final viewProfile = Provider.of<SettingsProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final viewProfile = Provider.of<SettingsProvider>(context, listen: false);
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
                              onPressed: () => Navigator.pop(context),
                              /*Scaffold.of(context).openDrawer(),*/
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
              padding: EdgeInsets.symmetric(horizontal: 12),
              children: [
                /// notification Button
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: ExpansionTile(
                      title: const Text('Notifications'),
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              children: [
                                Container(
                                  child: FutureBuilder<
                                      setting_notification_model?>(
                                    future: viewProfile.getNotification(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        setting_notification_model? userInfo =
                                            snapshot.data;
                                        if (userInfo != null) {
                                          return ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: userInfo.data!.length,
                                              itemBuilder: (BuildContext ctxt,
                                                  int index) {
                                                return Row(
                                                  children: [
                                                    Container(
                                                      height: 45,
                                                      width: 45,
                                                      child: GFCheckbox(
                                                        activeBgColor:
                                                            ColorsManager
                                                                .APP_MAIN_COLOR,
                                                        size: GFSize.SMALL,
                                                        type: GFCheckboxType
                                                            .square,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            isChecked = value;
                                                          });
                                                        },
                                                        value: isChecked,
                                                        inactiveIcon: null,
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(snapshot.data!
                                                          .data![index].name
                                                          .toString()),
                                                    )
                                                  ],
                                                );
                                              });
                                        }
                                      }
                                      return Center(
                                          child: CircularProgressIndicator());
                                    },
                                  ),
                                ),
                                MyCustomButton(
                                  onPressedbtn: () {},
                                  text: "Save",
                                  height: 40,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                  mergin: EdgeInsets.symmetric(vertical: 12),
                                  width: 144,
                                )
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            )),
                      ]),
                ),

                /// security button
                SizedBox(height: 10),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child:
                      ExpansionTile(title: const Text('Security'), children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: ColorsManager.COLOR_GRAY)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 31.0, vertical: 10),
                              child: Text(
                                "Phone Number",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700),
                              )),
                          Divider(color: ColorsManager.COLOR_GRAY, height: 10),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 31.0, vertical: 10),
                              child: Text(
                                "+xx xxxxxxxx12",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700),
                              )),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 31.0, vertical: 10),
                              child: Text(
                                "Keep your primary phone number up-to-date",
                                style: TextStyle(fontSize: 16.sp),
                              )),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 31.0, vertical: 10),
                              child: Text(
                                "Required",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: ColorsManager.COLOR_GREEN,
                                    fontWeight: FontWeight.w700),
                              )),
                          MyCustomButton(
                            text: "Manage",
                            onPressedbtn: () {},
                            width: 140,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            mergin: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 31),
                          )
                        ],
                      ),
                    )
                  ]),
                ),

                /// payment methode button
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

                /// payment methode button
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
