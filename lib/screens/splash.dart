import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:neeleez_flutter_app/api/apiRepository.dart';
import 'package:neeleez_flutter_app/config/my_Image.dart';
import 'package:neeleez_flutter_app/models/country_info.dart';
import 'package:sizer/sizer.dart';

import 'on_boarding/on_boarding_one.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage(MyImage.splashBackground),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 8.h),
            Expanded(
              flex: 5,
              child: Center(
                child: Hero(
                  tag: 'logo',
                  child: Image.asset(
                    height: 230.sp,
                    MyImage.logo,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Text(
                'BUSINESS APP',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void countryData() async {
    final res = await apiRepository.apiGet('https://ipwhois.app/json/', false);
    if (res != null) {
      final info = CountryInfo.fromJson(res);
      log(info.countryCode.toString());
      Get.offAll(() => const OnBoardingOneScreen());
    }
  }
}
