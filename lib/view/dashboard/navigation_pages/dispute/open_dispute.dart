import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:we_coin/common_widget/my_custom_button.dart';
import 'package:we_coin/common_widget/my_custom_textfield.dart';

class OpenDisputeScreen extends StatelessWidget {
  const OpenDisputeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.h,
        title: Text("open Dispute"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backwardsCompatibility: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        children: [
          SizedBox(height: 40.h),
          SizedBox(height: 30, child: Text("Type")),
          MyCustomTextField(
              hint: 'Select', suffixIcon: Icon(Icons.expand_more)),
          SizedBox(height: 20.h),
          SizedBox(height: 30, child: Text("Subject")),
          MyCustomTextField(hint: 'Type'),
          SizedBox(height: 20.h),
          SizedBox(height: 30, child: Text("Description")),
          MyCustomTextField(
            hint: 'Type',
            maxLines: 6,
          ),
          SizedBox(height: 40.h),
          MyCustomButton(
            mergin: EdgeInsets.zero,
            onPressedbtn: () {},
            text: "Confirm",
          )
        ],
      ),
    );
  }
}
