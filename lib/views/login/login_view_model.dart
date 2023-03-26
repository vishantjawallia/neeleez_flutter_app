import 'dart:developer';

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
  String username = "raheel@ymail.com";
  String password = "123456";
  UserData? userData;

  LoginViewModel() {
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

  /* loginHandler */
  void loginHandler() async {
    setBusy(true);
    try {
      final res = await apiRepository.apiGet(url: '${Url.login}$username/$password');
      if (res != null) {
        userData = UserData.fromJson(res);
        await SharedPreferenceHelper.setInt(Preferences.customerId, userData!.countryId!);
        await SharedPreferenceHelper.setBoolean(Preferences.isLogged, true);
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
      Get.offAll(() => const DashboardView());
    }
  }

  void onChangeEmail(String? value) {
    username = value!;
    notifyListeners();
  }

  void onChangePassword(String? value) {
    password = value!;
    notifyListeners();
  }
}
