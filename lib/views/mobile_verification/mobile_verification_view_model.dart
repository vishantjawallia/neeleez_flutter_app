import 'package:stacked/stacked.dart';

class MobileVerificationViewModel extends BaseViewModel {
  MobileVerificationViewModel(){
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


  void sendHandler() {
  }
}