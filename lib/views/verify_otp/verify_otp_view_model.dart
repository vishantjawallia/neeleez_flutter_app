// ignore_for_file: override_on_non_overriding_member, unused_element

import 'dart:async';

import 'package:stacked/stacked.dart';

class VerifyOtpViewModel extends BaseViewModel {
  late Timer _timer;
  int timeLeftInSeconds = 0;
  // int _timeLeftInSeconds = 0;

  VerifyOtpViewModel() {
    // loadItems();
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

  @override
  void init() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeftInSeconds > 0) {
        timeLeftInSeconds--;
      } else {
        _timer.cancel();
      }
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Stream<int?> timerStream() async* {
    int? i = 60;
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
