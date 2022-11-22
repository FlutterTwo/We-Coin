import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../utils/color_manager.dart';
import '../../../../utils/image_manager.dart';
import '../profile/profile_page.dart';

class RecivedMoneyPageScreen extends StatefulWidget {
  const RecivedMoneyPageScreen({Key? key}) : super(key: key);

  @override
  State<RecivedMoneyPageScreen> createState() => _RecivedMoneyPageScreenState();
}

class _RecivedMoneyPageScreenState extends State<RecivedMoneyPageScreen> {
  List<String> _text2 = ['Bitcoin', 'Wecoin', 'Litecoin', 'Bitcoin'];
  List<String> list2 = [
    ImageManager.notification_bill,
    ImageManager.user_pro,
    ImageManager.notification_bill,
    ImageManager.notification_bill,
  ];
  List<String> qr_list = [
    ImageManager.qr_1,
    ImageManager.qr_1,
    ImageManager.qr_1,
    ImageManager.qr_1,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: ColorsManager.APP_MAIN_COLOR,
            height: MediaQuery.of(context).size.height * 0.25,
            alignment: Alignment.center,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppBar(
                    backgroundColor: Colors.transparent,
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    backwardsCompatibility: false,
                    foregroundColor: ColorsManager.WHITE_COLOR,
                    centerTitle: true,
                    leadingWidth: 30,
                    leading: InkWell(
                        onTap: () => Scaffold.of(context).openDrawer(),
                        child: Image.asset(
                          ImageManager.drawer_icon,
                          color: ColorsManager.WHITE_COLOR,
                        )),
                    title: Text("Recived Money"),
                    actions: [
                      InkWell(
                        onTap: () => Get.to(ProfilePageScreen()),
                        child: CircleAvatar(
                          child: Image.asset(ImageManager.user_pro),
                        ),
                      )
                    ]),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ListView(
                shrinkWrap: false,
                padding: EdgeInsets.symmetric(vertical: 20),
                children: List.generate(
                  list2.length,
                  (index) => InkWell(
                      onTap: () {},
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 10),
                          leading: CircleAvatar(
                            child: Image.asset(
                              list2[index],
                              width: 40,
                              height: 50,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _text2[index],
                                textDirection: TextDirection.rtl,
                                softWrap: true,
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                _text2[index],
                                textDirection: TextDirection.rtl,
                                softWrap: true,
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Image.asset(
                                qr_list[index],
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
