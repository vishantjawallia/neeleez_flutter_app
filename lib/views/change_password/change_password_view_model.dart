import 'package:stacked/stacked.dart';

import '../../models/user_data.dart';
import '../dashboard/dashboard_view_model.dart';

class ChangePasswordViewModel extends BaseViewModel {
  UserData? get user => userData;
  UserData? userData;
  ChangePasswordViewModel() {
    loadItems();
  }

  // Add ViewModel specific code here
  Future<void> loadItems() async {
    setBusy(true);
    // userData ??= await getUserData();
    //Write your models loading codes here

    //Let other views to render again
    setBusy(false);
    notifyListeners();
  }
}
