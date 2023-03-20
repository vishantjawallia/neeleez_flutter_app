// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_Image.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helper/helper.dart';
import 'package:neeleez_flutter_app/screens/authentication/login/login.dart';

class OnBoardingThreeScreen extends StatelessWidget {
  const OnBoardingThreeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 100.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(MyImage.onBoarding3),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Image.asset(
                      height: 220,
                      MyImage.logo,
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Lorem Ipsum',
                          style: Get.textTheme.headline2,
                        ),
                        SizedBox(height: 1.5.h),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                          style: Get.textTheme.bodyText2,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 3.h),
                        ElevatedButton(
                          onPressed: () => nextHandler(context),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Palettes.red),
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(horizontal: 38, vertical: 8),
                            ),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                  color: Palettes.red,
                                ),
                              ),
                            ),
                          ),
                          child: Text(
                            style: Get.textTheme.headline4,
                            'NEXT',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void nextHandler(context) {
    Get.to(() => const LoginScreen());
    // Navigator.push(context, MaterialPageRoute(builder: (context) => const OnBoardingTScreen()));
  }
}
