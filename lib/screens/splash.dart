import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/api/apiRepository.dart';
import 'package:neeleez_flutter_app/config/my_Image.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
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
            fit: BoxFit.cover,
            image: AssetImage(MyImage.splashBackground1),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 8.h),
            Expanded(
              flex: 6,
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
              flex: 5,
              child: Text(
                'businessApp'.tr,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  SizedBox(
                    height: 24.sp,
                    width: 24.sp,
                    child: const CircularProgressIndicator(
                      color: Palettes.white,
                      strokeWidth: 3,
                    ),
                  ),
                  SizedBox(height: 8.sp),
                  Text(
                    'preparingApplicationEnvironment'.tr,
                    style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void countryData() async {
      // Future.delayed(const Duration(seconds: 2), () async {
    final res = await apiRepository.apiGet('https://ipwhois.app/json/', false);
    if (res != null) {
      final info = CountryInfo.fromJson(res);
      log(info.countryCode.toString());
        Get.offAll(() => const OnBoardingOneScreen());
    }
  }
      // });
}
