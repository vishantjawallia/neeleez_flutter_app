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
    String password = SharedPreferenceHelper.getString(Preferences.password) ?? "N/A";
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
    Get.to(() => const MobileVerificationView(loading: true), transition: Transition.downToUp);
  }

  onChangeRemember(bool? value) {
    rememberMe = value!;
    notifyListeners();
  }

  void forgetPasswordHandler() {
    Get.to(() => ForgetPasswordView(loading: true));
  }

  // void onChangeEmail(String? value) {
  //   username = value!;
  //   notifyListeners();
  // }

  // void onChangePassword(String? value) {
  //   password = value!;
  //   notifyListeners();
  // }

  /* loginHandler */
  void loginHandler() async {
    String username = usernameController.text;
    String password = passwordController.text;
    if (!rememberMe || (username.isEmpty || password.isEmpty)) {
      return;
    }
    setBusy(true);
    try {
      final res = await apiRepository.apiGet(url: '${Url.CustomerSignIn}/$username/$password');
      if (res != null) {
        userData = UserData.fromJson(res);
        notifyListeners();
        log("Error===========>${userData!.customerId!}");
        await SharedPreferenceHelper.setString(Preferences.customerId, "${userData!.customerId!}");
        await SharedPreferenceHelper.setBoolean(Preferences.isLogged, true);
        await SharedPreferenceHelper.setString(Preferences.username, username);
        await SharedPreferenceHelper.setString(Preferences.password, password);
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
