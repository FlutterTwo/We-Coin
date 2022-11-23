import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:we_coin/common_widget/my_custom_button.dart';
import 'package:we_coin/common_widget/my_custom_textfield.dart';
import 'package:we_coin/utils/color_manager.dart';
import 'package:we_coin/utils/image_manager.dart';

class DepositPageScreen extends StatefulWidget {
  const DepositPageScreen({Key? key}) : super(key: key);

  @override
  State<DepositPageScreen> createState() => _DepositPageScreenState();
}

class _DepositPageScreenState extends State<DepositPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            color: ColorsManager.APP_MAIN_COLOR,
            height: MediaQuery.of(context).size.height * 0.25,
            alignment: Alignment.center,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Deposit",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorsManager.WHITE_COLOR),
                ),
                SizedBox(height: 20.h),
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
          Expanded(
            // padding: EdgeInsetss.symmetric(horizontal: 12.w),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: ListView(
                primary: false,
                children: [
                  Container(
                    child: Text(
                      "Please fill the form to deposit money",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: ColorsManager.COLOR_BLACK),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 71.w, vertical: 20.h),
                  ),
                  SizedBox(height: 30, child: Text("From Wallet")),
                  MyCustomTextField(
                    hint: "Select Wallet",
                    suffixIcon: Icon(Icons.expand_more_outlined),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(height: 30, child: Text("To Wallet")),
                  MyCustomTextField(
                    hint: "wallet",
                    suffixIcon: Icon(Icons.expand_more_outlined),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(height: 30, child: Text("You will give")),
                  MyCustomTextField(
                    hint: "\$750.00",
                  ),
                  SizedBox(height: 40.h),
                  MyCustomButton(
                    mergin: EdgeInsets.zero,
                    onPressedbtn: () {
                      _onAlertButtonPressed(context);
                    },
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

  _onAlertButtonPressed(context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Payment Deposit Successfully",
      style: AlertStyle(
        descStyle: TextStyle(fontSize: 12.sp),
        overlayColor: Colors.transparent,
        buttonAreaPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      ),
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      buttons: [
        DialogButton(
          color: ColorsManager.YELLOWBUTTON_COLOR,
          child: Text(
            "View Wallet",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => _onAlertErrorButtonPressed(context),
          width: 180,
        )
      ],
    ).show();
  }

  _onAlertErrorButtonPressed(context) {
    Alert(
      context: context,
      type: AlertType.error,
      title: "Payment Exchanege Failed                            ",
      style: AlertStyle(
        descStyle: TextStyle(fontSize: 12.sp),
        overlayColor: Colors.transparent,
        buttonAreaPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      ),
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      buttons: [
        DialogButton(
          border: Border.all(color: ColorsManager.APP_MAIN_COLOR),
          child: Text(
            "Try Again",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 180,
        )
      ],
    ).show();
  }
}
