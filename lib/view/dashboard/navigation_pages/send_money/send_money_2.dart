import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common_widget/my_custom_button.dart';
import '../../../../common_widget/my_custom_textfield.dart';
import '../../../../utils/color_manager.dart';

class SendMoney_2Screen extends StatelessWidget {
  const SendMoney_2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.15,
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
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: ColorsManager.WHITE_COLOR,
                              ),
                            ),
                            Text('Send Bitcoin',
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
                    ],
                  ))),
          Expanded(
            // padding: EdgeInsetss.symmetric(horizontal: 12.w),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: ListView(
                primary: false,
                children: [
                  SizedBox(height: 30, child: Text("Currency")),
                  MyCustomTextField(
                    hint: 'BTC',
                    suffixIcon: Icon(Icons.expand_more_outlined),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(height: 30, child: Text("From")),
                  MyCustomTextField(
                    hint: "Private key wallet",
                    suffixIcon: Icon(Icons.expand_more_outlined),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(height: 30, child: Text("To")),
                  MyCustomTextField(
                    hint: "Paste scan or select destination",
                    suffixIcon: Icon(Icons.qr_code_2_rounded),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(height: 30, child: Text("Amount")),
                  MyCustomTextField(
                    hint: "0.00",
                    suffixIcon: Icon(Icons.currency_bitcoin),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(height: 30, child: Text("Note")),
                  MyCustomTextField(
                    hint: "Optional message",
                    maxLines: 4,
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(height: 30, child: Text("Network fee")),
                  MyCustomTextField(
                    hint: "Regular",
                    suffixIcon: Icon(Icons.expand_more_outlined),
                  ),
                  SizedBox(height: 40.h),
                  MyCustomButton(
                    mergin: EdgeInsets.zero,
                    onPressedbtn: () {},
                    text: "Confirm",
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
