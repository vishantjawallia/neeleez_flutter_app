// ignore_for_file: deprecated_member_use, avoid_print

// import 'dart:html';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/route_manager.dart';
import 'package:neeleez_flutter_app/api/apiRepository.dart';
import 'package:neeleez_flutter_app/config/my_Image.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/config/preference.dart';
import 'package:neeleez_flutter_app/config/url.dart';
import 'package:neeleez_flutter_app/models/country_info.dart';
import 'package:neeleez_flutter_app/screens/on_boarding/on_boarding_one.dart';

import '../config/prefConstatnt.dart';

//

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: 100.h,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(MyImage.splashBackground1),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 6,
              child: Center(
                child: Hero(
                  tag: 'logo',
                  child: Image.asset(
                    height: 240,
                    MyImage.logo,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                'businessApp'.tr,
                style: Get.textTheme.headline1,
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: FutureBuilder(
                      future: splashHandler(context),
                      builder: (context, snapshot) {
                        return const CircularProgressIndicator(
                          color: Palettes.white,
                          strokeWidth: 3,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'preparingApplicationEnvironment'.tr,
                    style: Get.textTheme.headline5!.copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  splashHandler(context) async {
    Future.delayed(const Duration(seconds: 2), () async {
      try {
        final res = await apiRepository.apiGet(Url.countryInfo);
        if (res != null) {
          CountryInfo info = CountryInfo.fromJson(res);
          SharedPreferenceHelper.setString(Preferences.countryInfo, jsonEncode(res));
          // Get.updateLocale(const Locale('pb', 'IN'));
          Get.off(() => const OnBoardingOneScreen());
        }
      } catch (e) {
        print("=========>splash error: $e");
      }
    });
  }
}
