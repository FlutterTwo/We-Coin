import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:we_coin/common_widget/my_custom_button.dart';
import 'package:we_coin/utils/color_manager.dart';
import 'package:we_coin/view/auth/login.dart';

import '../../common_widget/my_custom_passwordfield.dart';
import '../../common_widget/my_custom_textfield.dart';
import '../../data/repositry/auth_repo.dart';
import '../../utils/image_manager.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();
    final _sign_up = Provider.of<Auth_Provider>(context, listen: false);
    return Scaffold(
      bottomSheet: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'Already have account?',
              style: TextStyle(color: Colors.black, fontSize: 18),
              children: <TextSpan>[
                TextSpan(
                    text: ' SIGN IN',
                    style: TextStyle(color: Colors.blueAccent, fontSize: 18),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // navigate to desired screen
                        Get.to(LoginScreen());
                      })
              ]),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                "Create new account",
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.only(top: 15, bottom: 40),
                alignment: Alignment.center,
                child: Text(
                  "Lorem Ipsum is simply dummy text of the \nprinting and typesetting industry.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: ColorsManager.TEXT_COLOR),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    MyCustomTextField(
                      hint: "Full Name",
                      controller: fullNameController,
                      prefixIcon: Icon(Icons.person),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter a valid name!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 25),
                    MyCustomTextField(
                      hint: "Email",
                      controller: emailController,
                      prefixIcon: Icon(Icons.email),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter a valid email!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 25),
                    MyPasswordTextFormField(
                      controller: passwordController,
                      prefixIcon: Icon(Icons.lock),
                      hint: "Password",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please a Enter Eamil';
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return 'Please a valid Email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 25),
                    MyCustomTextField(
                      controller: phoneController,
                      prefixIcon: Icon(Icons.phone),
                      hint: "+91515117171",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter a valid phone no!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 25),
                    Container(
                      child: CSCPicker(
                        showStates: false,
                        showCities: false,
                        flagState: CountryFlag.ENABLE,
                        defaultCountry: DefaultCountry.Pakistan,

                        ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
                        dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: const Color(0xFFF0F0F0),
                            border: Border.all(
                                color: const Color(0xFFF0F0F0), width: 4.5)),

                        ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                        disabledDropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: const Color(0xFFF0F0F0),
                            border: Border.all(
                                color: const Color(0xFFF0F0F0), width: 4.5)),

                        ///placeholders for dropdown search field
                        countrySearchPlaceholder: "$countryValue",

                        ///labels for dropdown
                        countryDropdownLabel: "$countryValue",

                        selectedItemStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),

                        ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                        dropdownHeadingStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),

                        ///DropdownDialog Item style [OPTIONAL PARAMETER]
                        dropdownItemStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        dropdownDialogRadius: 10.0,
                        searchBarRadius: 10.0,

                        onCountryChanged: (value) {
                          setState(() {
                            ///store value in country variable
                            countryValue = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 25),

                    /*
                    SizedBox(height: 25.h),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Captcha",
                        textAlign: TextAlign.start,
                      ),
                    ),*/
                    /*Container(
                      margin: EdgeInsets.only(top: 5.h),
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        ImageManager.catptcha,
                        height: 35,
                      ),
                    ),*/
                    // SizedBox(height: 25.h),

                    SizedBox(height: 40.h),
                    MyCustomButton(
                      onPressedbtn: () {
                        if (_formKey.currentState!.validate()) {
                          print("successful");
                          _sign_up.sign_up(
                              context,
                              fullNameController.text,
                              emailController.text,
                              passwordController.text,
                              phoneController.text,
                              countryValue);

                          return;
                        } else {
                          print("UnSuccessfull");
                        }
                      },
                      text: "Login",
                      mergin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
