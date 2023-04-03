// ignore_for_file: override_on_non_overriding_member, unused_element

import 'dart:async';

import 'package:stacked/stacked.dart';

class VerifyOtpViewModel extends BaseViewModel {
  final String? phoneNumber;

  VerifyOtpViewModel({this.phoneNumber}) {
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

  void verifyHandler() {}

  Stream<int?> timerStream() async* {
    int? i = 30;
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
}
