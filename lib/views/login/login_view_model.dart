// ignore_for_file: unused_field

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/api/apiRepository.dart';
import 'package:neeleez_flutter_app/config/pref_constant.dart';
import 'package:neeleez_flutter_app/config/preference.dart';
import 'package:neeleez_flutter_app/config/url.dart';
import 'package:neeleez_flutter_app/models/user_data.dart';
import 'package:neeleez_flutter_app/views/forget_password/forget_password_view.dart';
import 'package:neeleez_flutter_app/views/mobile_verification/mobile_verification_view.dart';
import 'package:stacked/stacked.dart';

import '../dashboard/dashboard_view.dart';

class LoginViewModel extends BaseViewModel {
  bool rememberMe = false;
  String username = "";
  String password = "";
  UserData? userData;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginViewModel() {
    usernameController.addListener(() {
      notifyListeners();
    });
    passwordController.addListener(() {
      notifyListeners();
    });
    loadItems();
  }

  // Add ViewModel specific code here
  Future<void> loadItems() async {
    setBusy(true);
    String username = SharedPreferenceHelper.getString(Preferences.username) ?? "N/A";
    String password = SharedPreferenceHelper.getString(Preferences.username) ?? "N/A";
    if (username != "N/A") {
      usernameController.text = username;
      passwordController.text = password;
    }

    //Write your models loading codes here

    //Let other views to render again
    setBusy(false);
    notifyListeners();
  }

  void onTap() {}

  void signUpHandler() {
    Get.to(() => const MobileVerificationView(), transition: Transition.downToUp);
  }

  onChangeRemember(bool? value) {
    rememberMe = value!;
    notifyListeners();
  }

  void forgetPasswordHandler() {
    Get.to(() => ForgetPasswordView());
  }

  void onChangeEmail(String? value) {
    username = value!;
    notifyListeners();
  }

  void onChangePassword(String? value) {
    password = value!;
    notifyListeners();
  }

  /* loginHandler */
  void loginHandler() async {
    if (!rememberMe) {
      return;
    }
    setBusy(true);
    try {
      final res = await apiRepository.apiGet(url: '${Url.CustomerSignIn}${usernameController.text}/${passwordController.text}');
      if (res != null) {
        userData = UserData.fromJson(res);
        await SharedPreferenceHelper.setString(Preferences.customerId, userData!.countryId!.toString());
        await SharedPreferenceHelper.setBoolean(Preferences.isLogged, true);
        // await SharedPreferenceHelper.setString(Preferences.username, usernameController.text);
        // await SharedPreferenceHelper.setString(Preferences.password, passwordController.text);
      }
    } catch (e) {
      log("Error===========>$e");
    } finally {
      log(userData.toString());
      log("===========>finally");
    }
    setBusy(false);
    notifyListeners();
    if (userData != null) {
      Get.offAll(() => DashboardView(userData: userData));
    }
  }
}
