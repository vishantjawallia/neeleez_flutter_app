// ignore_for_file: override_on_non_overriding_member, unused_element

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/models/company/companies.dart';
import 'package:stacked/stacked.dart';

import '../mobile_verification/service/mobile_verification_service.dart';
import '../registration/registration_view.dart';

class VerifyOtpViewModel extends BaseViewModel with MobileVerificationService {
  final String? phoneNumber;
  final String? countryCode;
  Countries? country;
  String? phoneNumberWithCode;
  int? otpTiming = 60;

  TextEditingController otp = TextEditingController();

  FocusScopeNode otpFocusNode = FocusScopeNode();

  VerifyOtpViewModel({this.phoneNumber, this.countryCode, this.country}) {
    phoneNumberWithCode = countryCode! + phoneNumber!;
    notifyListeners();
    otp.addListener(() => notifyListeners());
    otpFocusNode.addListener(() => notifyListeners());

    loadItems();
  }

  // Add ViewModel specific code here
  Future<void> loadItems() async {
    setBusy(true);

    //Write your models loading codes here

    //Let other views to render again
    setBusy(false);
    notifyListeners();
  }

  void verifyHandler(_) async {
    // if (otp.text.isEmpty) {
    //   warningPopup(_, dsc: "Invalid OTP");
    //   return;
    // }
    // if (otp.text == "007700") {
    //   SignIn? res2 = await newSignIn(phoneNumber);
    //   if (res2!.companyId != null) {
    //     await SharedPreferenceHelper.setString(Preferences.companyId, res2.companyId!.toString());
    //     await SharedPreferenceHelper.setString(Preferences.countryId, "${country!.id}");
    //     await SharedPreferenceHelper.setBoolean(Preferences.isLogged, true);
    Get.to(() => const RegistrationView());
    //   }
    // } else {
    //   warningPopup(_, dsc: "Invalid OTP");
    // }
  }

  Stream<int?> timerStream() async* {
    int? i = otpTiming;
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      if (i! > 0) {
        i--;
        yield i;
      } else {
        break;
      }
    }
  }

  void mobileChangeHandler() {
    // Get.
  }
}
