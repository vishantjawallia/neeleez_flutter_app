import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/pref_constant.dart';
import 'package:neeleez_flutter_app/views/login/login_view.dart';
import 'package:stacked/stacked.dart';

import '../../config/preference.dart';

class OnBoarding3ViewModel extends BaseViewModel {
  OnBoarding3ViewModel() {
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

  void onTap() async {
    await SharedPreferenceHelper.setBoolean(Preferences.isOnboardingCompleted, true).then((value) {
      Get.to(() => const LoginView());
    });
  }
}
