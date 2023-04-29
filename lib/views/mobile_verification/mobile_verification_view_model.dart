import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import '../verify_otp/verify_otp_view.dart';

class MobileVerificationViewModel extends BaseViewModel {
  bool loading;
  TextEditingController phoneController = TextEditingController();

  MobileVerificationViewModel(this.loading) {
    phoneController.addListener(() {
      if (phoneController.text.length == 3 && !phoneController.text.contains('-')) {
        phoneController
          ..text = "${phoneController.text}-"
          ..selection = TextSelection(
            baseOffset: phoneController.text.length,
            extentOffset: phoneController.text.length,
          );
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
    Get.off(() => const VerifyOtpView());
  }

  // void onPhoneInputChange(String? value) {
  //   if (newVal.length == 5) {
  //     f1.unfocus();
  //     FocusScope.of(context).requestFocus(f2);
  //   }
  //   // if (value!.length == 3 && !value.contains('-')) {
  //   //   phoneController
  //   //     ..text = "$value-"
  //   //     ..selection = TextSelection(
  //   //       baseOffset: value.length,
  //   //       extentOffset: value.length,
  //   //     );
  //   // }

  //   // notifyListeners();
  // }
}


class NumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      print(text.length);
      if (nonZeroIndex <= 3) {
        print("non");
        print(nonZeroIndex);
        if (nonZeroIndex % 3 == 0 && nonZeroIndex != text.length) {
          buffer.write('-'); // Add double spaces.
        }
      } else {
        if (nonZeroIndex % 12 == 0 && nonZeroIndex != text.length) {
          buffer.write('-'); // Add double spaces.
        }
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(text: string, selection: TextSelection.collapsed(offset: string.length));
  }
}
