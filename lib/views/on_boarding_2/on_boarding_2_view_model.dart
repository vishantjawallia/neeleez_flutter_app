import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:neeleez_flutter_app/views/on_boarding_3/on_boarding_3_view.dart';
import 'package:stacked/stacked.dart';

class OnBoarding2ViewModel extends BaseViewModel {
  OnBoarding2ViewModel() {
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
    Get.to(() => OnBoarding3View());
  }
}
