import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:neeleez_flutter_app/api/apiRepository.dart';
import 'package:neeleez_flutter_app/config/my_Image.dart';
import 'package:neeleez_flutter_app/models/country_info.dart';
import 'package:neeleez_flutter_app/screens/on_boarding/on_boarding_one.dart';
import 'package:sizer/sizer.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
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
            image: AssetImage(
              MyImage.splash_background,
            ),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 8.h),
            Expanded(
              flex: 5,
              child: Center(
                child: Image.asset(
                  height: 160,
                  MyImage.logo,
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
      Get.offAll(() => const OnBoardingOne());
    }
  }
}
