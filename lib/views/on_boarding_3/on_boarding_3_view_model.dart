import 'package:get/get.dart';
import 'package:neeleez_flutter_app/views/login/login_view.dart';
import 'package:neeleez_flutter_app/views/on_boarding_3/on_boarding_3_view.dart';
import 'package:stacked/stacked.dart';

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

  void onTap() {
    Get.to(() => const LoginView());
  }
}
