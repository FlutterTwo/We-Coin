import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/checkbox/gf_checkbox.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';

import '../../../../utils/color_manager.dart';
import '../../drawer.dart';
import '../profile/forgot_password.dart';
import 'open_dispute.dart';

class DisputedPageScreen extends StatefulWidget {
  static const String routeName = '/notificationPage';
  const DisputedPageScreen({Key? key}) : super(key: key);

  @override
  State<DisputedPageScreen> createState() => _DisputedPageScreenState();
}

class _DisputedPageScreenState extends State<DisputedPageScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.WHITE_COLOR,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OpenDisputeScreen()));
          }),
      body: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.17,
              alignment: Alignment.center,
              color: ColorsManager.APP_MAIN_COLOR,
              child: Center(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 17.w),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () => Scaffold.of(context).openDrawer(),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: ColorsManager.WHITE_COLOR,
                              ),
                            ),
                            Text(
                              'Dispute',
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  color: ColorsManager.WHITE_COLOR),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(ForgotPasswordPageScreen());
                              },
                              child: Icon(Icons.search,
                                  color: ColorsManager.WHITE_COLOR),
                            )
                          ])))),
          Expanded(
            child: new ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Container(
                      margin: new EdgeInsets.fromLTRB(10, 0, 10, 10),
                      width: 25.0,
                      height: MediaQuery.of(context).size.height * 0.21,
                      child: Card(
                        elevation: 7,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        color: Colors.white,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              color: isChecked == false
                                  ? ColorsManager.YELLOWBUTTON_COLOR
                                  : ColorsManager.COLOR_GREEN,
                              width: 5,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  print('testing');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 12, bottom: 12),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      new Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          new Text(
                                            'ID: 54545454',
                                          ),
                                          Column(
                                            children: [
                                              GFCheckbox(
                                                activeBgColor: Colors.green,
                                                size: GFSize.SMALL,
                                                type: GFCheckboxType.circle,
                                                onChanged: (value) {
                                                  setState(() {
                                                    isChecked = value;
                                                  });
                                                },
                                                value: isChecked,
                                                inactiveIcon: null,
                                              ),
                                              isChecked == false
                                                  ? Text("Open")
                                                  : Text("Close")
                                            ],
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Transaction Type",
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Container(
                                        height: 50,
                                        padding: EdgeInsets.only(top: 5),
                                        child: Text(
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: ColorsManager.COLOR_GRAY,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Text(
                                        "15 : 30 | 22 Oct, 2022",
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: ColorsManager.APP_MAIN_COLOR,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
                }),
          ),
        ],
      ),
    );
  }
}
