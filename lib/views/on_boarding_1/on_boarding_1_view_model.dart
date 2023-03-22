import 'package:get/get.dart';
import 'package:neeleez_flutter_app/views/on_boarding_2/on_boarding_2_view.dart';
import 'package:stacked/stacked.dart';

class OnBoarding1ViewModel extends BaseViewModel {
  OnBoarding1ViewModel() {
    loadItems();
  }

  // Add ViewModel specific code here
  Future<void> loadItems() async {
    setBusy(true);
    setBusy(false);
    notifyListeners();
  }

  onTap() {
    Get.to(() => OnBoarding2View());
  }
}
