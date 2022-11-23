import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:we_coin/common_widget/my_custom_button.dart';
import 'package:we_coin/common_widget/my_custom_textfield.dart';

import '../../../../utils/color_manager.dart';

class OpenTicketScreen extends StatelessWidget {
  const OpenTicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.17,
            color: ColorsManager.APP_MAIN_COLOR,
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            alignment: Alignment.topCenter,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: ColorsManager.WHITE_COLOR,
                      )),
                  Text(
                    'Open Ticket',
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorsManager.WHITE_COLOR),
                  ),
                  SizedBox(width: 60),
                ],
              ),
            ),
          ),
          Expanded(
              child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 12),
            children: [
              SizedBox(height: 25),
              SizedBox(height: 25, child: Text("Priority")),

              MyCustomTextField(
                hint: "Select",
                suffixIcon: Icon(Icons.expand_more),
              ),
              SizedBox(height: 25),
              SizedBox(height: 25, child: Text("Subject")),
              MyCustomTextField(hint: "Type"),
              SizedBox(height: 25),
              SizedBox(height: 25, child: Text("Message")),
              MyCustomTextField(hint: "Type....", maxLines: 7),
              // button
            ],
          )),
          MyCustomButton(
            onPressedbtn: () {},
            text: "Confirm",
          )
        ],
      ),
    );
  }
}
