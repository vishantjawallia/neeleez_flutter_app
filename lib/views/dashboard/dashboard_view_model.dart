import 'package:stacked/stacked.dart';

class DashboardViewModel extends BaseViewModel {
  DashboardViewModel(){
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


  // void onTap() {
  //    try {
  //             _scaffoldKey.currentState!.openDrawer();
  //           } catch (e) {
  //             Get.log("$e");
  //           }
  // }
}