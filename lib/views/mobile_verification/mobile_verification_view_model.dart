import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import '../verify_otp/verify_otp_view.dart';

class MobileVerificationViewModel extends BaseViewModel {
  bool loading;
  TextEditingController phoneController = TextEditingController();
  MobileVerificationViewModel(this.loading) {
    phoneController.addListener(() {
      if (phoneController.text.length == 3) {
        phoneController.text = '${phoneController.text}-';
      }
      notifyListeners();
    });
    loadItems();
  }

  // Add ViewModel specific code here
  Future<void> loadItems() async {
    setBusy(loading);
    //Write your models loading codes here

    //Let other views to render again
    Future.delayed(const Duration(seconds: 1), () {
      setBusy(false);
    });
    notifyListeners();
  }

  void sendHandler() {
    Get.off(() => VerifyOtpView());
  }
}
