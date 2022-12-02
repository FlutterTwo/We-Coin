import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:we_coin/common_widget/my_custom_button.dart';
import 'package:we_coin/common_widget/my_custom_textfield.dart';
import 'package:we_coin/utils/color_manager.dart';

import '../../../../data/model/view_profile_model.dart';
import '../../../../data/repositry/edit_profilr_repo.dart';
import '../../../../data/repositry/view_profile_get.dart';
import '../../../../utils/image_manager.dart';
import 'forgot_password.dart';

class EditProfilePageScreen extends StatelessWidget {
  EditProfilePageScreen({Key? key}) : super(key: key);

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _sign_up = Provider.of<EditProfile_Provider>(context, listen: false);
    final viewPro = Provider.of<ViewProfile_Provider>(context, listen: false);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                // background image and bottom contents
                Container(
                  color: ColorsManager.WHITE_COLOR,
                  child: Column(
                    children: <Widget>[
                      Container(
                          height: 160.0,
                          color: ColorsManager.APP_MAIN_COLOR,
                          child: Center(
                              child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.w),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.arrow_back_ios,
                                            color: ColorsManager.WHITE_COLOR,
                                          ),
                                          onPressed: () => Get.back(),
                                        ),
                                        Text(
                                          'Edit Profile',
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w600,
                                              color: ColorsManager.WHITE_COLOR),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.to(ForgotPasswordPageScreen());
                                          },
                                          child: CircleAvatar(
                                              child: Icon(Icons.lock_person,
                                                  color: ColorsManager
                                                      .WHITE_COLOR)),
                                        )
                                      ])))),
                      SizedBox(height: 50),
                      Expanded(
                        child: FutureBuilder<ViewProfileModel?>(
                          future: viewPro.getUser(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              ViewProfileModel? userInfo = snapshot.data;
                              if (userInfo != null) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: ListView(
                                    primary: false,
                                    children: [
                                      MyCustomTextField(
                                        controller: fullNameController,
                                        hint: snapshot.data!.data!.fullName
                                            .toString(),
                                        prefixIcon: Icon(Icons.person),
                                      ),
                                      SizedBox(height: 10.h),
                                      MyCustomTextField(
                                        controller: phoneController,
                                        hint: snapshot.data!.data!.phone
                                            .toString(),
                                        prefixIcon: Icon(Icons.phone),
                                      ),
                                      SizedBox(height: 10.h),
                                      MyCustomTextField(
                                        controller: emailController,
                                        hint: snapshot.data!.data!.email
                                            .toString(),
                                        prefixIcon: Icon(Icons.email_outlined),
                                      ),
                                      SizedBox(height: 10.h),
                                      MyCustomTextField(
                                        controller: passwordController,
                                        hint: "Address",
                                        prefixIcon:
                                            Icon(Icons.location_on_outlined),
                                      ),
                                      SizedBox(height: 10.h),
                                      MyCustomTextField(
                                        controller: countryController,
                                        hint: snapshot.data!.data!.country
                                            .toString(),
                                        prefixIcon:
                                            Icon(Icons.language_outlined),
                                      ),
                                      SizedBox(height: 10.h),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: MyCustomTextField(
                                            hint: "State",
                                            prefixIcon:
                                                Icon(Icons.map_outlined),
                                            suffixIcon: Icon(
                                                Icons.expand_more_outlined),
                                          )),
                                          SizedBox(width: 10.w),
                                          Expanded(
                                              child: MyCustomTextField(
                                            hint: "jadj",
                                            prefixIcon:
                                                Icon(Icons.apartment_outlined),
                                            suffixIcon: Icon(
                                                Icons.expand_more_outlined),
                                          )),
                                        ],
                                      ),
                                      MyCustomButton(
                                        text: "Confirm",
                                        mergin: EdgeInsets.symmetric(
                                            vertical: 20.h),
                                        onPressedbtn: () {
                                          _sign_up.editeProfile(
                                            context,
                                            fullNameController.text,
                                            emailController.text,
                                            passwordController.text,
                                            phoneController.text,
                                            countryController.text,
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                );
                              }
                            }
                            return Center(child: CircularProgressIndicator());
                          },
                        ),
                      ),
                      /*Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: ListView(
                            primary: false,
                            children: [
                              MyCustomTextField(
                                controller: fullNameController,
                                hint: "First Name",
                                prefixIcon: Icon(Icons.person),
                              ),
                              SizedBox(height: 10.h),
                              MyCustomTextField(
                                controller: phoneController,
                                hint: "+91515117171",
                                prefixIcon: Icon(Icons.phone),
                              ),
                              SizedBox(height: 10.h),
                              MyCustomTextField(
                                controller: emailController,
                                hint: "Email",
                                prefixIcon: Icon(Icons.email_outlined),
                              ),
                              SizedBox(height: 10.h),
                              MyCustomTextField(
                                controller: passwordController,
                                hint: "Address",
                                prefixIcon: Icon(Icons.location_on_outlined),
                              ),
                              SizedBox(height: 10.h),
                              MyCustomTextField(
                                controller: countryController,
                                hint: "Country",
                                prefixIcon: Icon(Icons.language_outlined),
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                children: [
                                  Expanded(
                                      child: MyCustomTextField(
                                    hint: "State",
                                    prefixIcon: Icon(Icons.map_outlined),
                                    suffixIcon:
                                        Icon(Icons.expand_more_outlined),
                                  )),
                                  SizedBox(width: 10.w),
                                  Expanded(
                                      child: MyCustomTextField(
                                    hint: "jadj",
                                    prefixIcon: Icon(Icons.apartment_outlined),
                                    suffixIcon:
                                        Icon(Icons.expand_more_outlined),
                                  )),
                                ],
                              ),
                              MyCustomButton(
                                text: "Confirm",
                                mergin: EdgeInsets.symmetric(vertical: 20.h),
                                onPressedbtn: () {
                                  _sign_up.editeProfile(
                                    context,
                                    fullNameController.text,
                                    emailController.text,
                                    passwordController.text,
                                    phoneController.text,
                                    countryController.text,
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      )*/
                    ],
                  ),
                ),
                // Profile image
                Positioned(
                  top:
                      110.0, // (background container size) - (circle height / 2)
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(ImageManager.user_pro),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                        color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
