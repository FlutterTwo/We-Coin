import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:we_coin/splash_screen.dart';
import 'package:we_coin/view/dashboard/drawer.dart';
import 'package:we_coin/view/dashboard/navbar.dart';
import 'package:we_coin/view/dashboard/navigation_pages/dispute/dispute.dart';
import 'package:we_coin/view/dashboard/navigation_pages/notification/notification.dart';
import 'package:we_coin/view/dashboard/navigation_pages/profile/profile_page.dart';
import 'package:we_coin/view/dashboard/navigation_pages/send_money/send_money.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'We Coin App',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: MyNavigationBar(),
          routes: {
            pageRoutes.home: (context) => ProfilePageScreen(),
          },
        );
      },
      // child: MainPageAppSelection(),
      // child: SplashScreen(),
      // child: Dashboard(),
      // child: Dashboard(),
    );
  }
}
