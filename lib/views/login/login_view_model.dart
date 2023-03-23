import 'package:get/get.dart';
import 'package:neeleez_flutter_app/views/mobile_verification/mobile_verification_view.dart';
import 'package:neeleez_flutter_app/views/registration/registration_view.dart';
import 'package:stacked/stacked.dart';

import '../dashboard/dashboard_view.dart';

class LoginViewModel extends BaseViewModel {
  bool rememberMe = false;
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

  void loginHandler() {
    Get.to(() => const DashboardView());
  }

  onChangeRemember(bool? value) {
    rememberMe = value!;
    notifyListeners();
  }

  void forgetPasswordHandler() {
    Get.to(() => const RegistrationView());
  }
}
