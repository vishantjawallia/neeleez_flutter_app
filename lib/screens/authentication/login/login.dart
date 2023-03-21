// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:neeleez_flutter_app/config/my_Image.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/helper/helper.dart';
import 'package:neeleez_flutter_app/screens/authentication/register.dart';
import 'package:neeleez_flutter_app/screens/dashboard/dashboard_screen.dart';
import 'package:neeleez_flutter_app/widgets/custom_button.dart';
// import 'package:neeleez_flutter_app/screens/dashboard/dashbard_screen.dart';
import 'package:neeleez_flutter_app/widgets/custom_text_field.dart';

import '../../../config/palettes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool? rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: 100.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(MyImage.splashBackground1),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Image.asset(
                  height: 220,
                  MyImage.logo,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => Get.locale == const Locale('ur', 'PK') ? Get.updateLocale(const Locale('en', 'US')) : Get.updateLocale(const Locale('ur', 'PK')),
                      child: Text(
                        'logIn'.tr,
                        style: Get.textTheme.headline1,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sedadipiscing elit",
                      style: Get.textTheme.bodyText2,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 36),
                    CustomTextField(
                      controller: _email,
                      name: 'Username / Email:',
                      prefixIconPath: MyIcon.profile,
                      suffixIconPath: MyIcon.checked1,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: _password,
                      name: 'Password',
                      obscureText: true,
                      prefixIconPath: MyIcon.password,
                      suffixIconPath: MyIcon.checked1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Align(
                          widthFactor: 0.68.sp,
                          child: Row(
                            children: [
                              Checkbox(
                                fillColor: MaterialStateProperty.all(Palettes.white),
                                focusNode: FocusNode(),
                                focusColor: Palettes.primary,
                                checkColor: Palettes.primary,
                                visualDensity: VisualDensity.standard,
                                value: rememberMe,
                                onChanged: (bool? value) {
                                  setState(() {
                                    rememberMe = !rememberMe!;
                                  });
                                },
                              ),
                              Text(
                                'Remember Me',
                                style: Get.textTheme.bodyText2,
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Forgot Password ?',
                            style: Get.textTheme.bodyText2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h),
                    CustomButton(
                      onTap: () => nextHandler(),
                      text: 'loginNow'.tr,
                    ),
                  ],
                ),
                Align(
                  heightFactor: 4.5.sp,
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: Get.textTheme.bodyText2,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const RegisterScreen());
                        },
                        child: Text(
                          "Sign Up",
                          style: Get.textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  nextHandler() {
    Get.to(() => DashboardScreen());
  }
}
