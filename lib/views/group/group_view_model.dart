import 'package:stacked/stacked.dart';

class GroupViewModel extends BaseViewModel {
  GroupViewModel(){
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

}