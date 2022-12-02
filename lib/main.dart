import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:we_coin/splash_screen.dart';
import 'package:we_coin/view/dashboard/drawer.dart';
import 'package:we_coin/view/dashboard/navbar.dart';
import 'package:we_coin/view/dashboard/navigation_pages/dispute/dispute.dart';
import 'package:we_coin/view/dashboard/navigation_pages/notification/notification.dart';
import 'package:we_coin/view/dashboard/navigation_pages/profile/profile_page.dart';
import 'package:we_coin/view/dashboard/navigation_pages/send_money/send_money.dart';

import 'data/model/fetch.dart';
import 'data/repositry/auth_repo.dart';
import 'data/repositry/edit_profilr_repo.dart';
import 'data/repositry/identity_verification.dart';
import 'data/repositry/otp_verification.dart';
import 'data/repositry/settings_repo.dart';
import 'data/repositry/view_profile_get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth_Provider()),
        ChangeNotifierProvider(create: (context) => IdentityVerification()),
        ChangeNotifierProvider(create: (context) => EditProfile_Provider()),
        ChangeNotifierProvider(create: (context) => OtpVerified_Provider()),
        ChangeNotifierProvider(create: (context) => ViewProfile_Provider()),
        ChangeNotifierProvider(create: (context) => SettingsProvider()),
      ],
      child: ScreenUtilInit(
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
            home: child,
          );
        },
        // child: MainPageAppSelection(),
        child: SplashScreen(),
        // child: ProfilePageScreen(),
        // child: Dashboard(),
      ),
    );
  }
}
