import 'package:stacked/stacked.dart';

class StaffProfileViewModel extends BaseViewModel {
  StaffProfileViewModel(){
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

  onTabChanged(context, int value) {}

  accountDeleteTapHandler(context) {}

}