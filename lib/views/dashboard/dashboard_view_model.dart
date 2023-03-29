import 'dart:developer';

import 'package:neeleez_flutter_app/api/apiRepository.dart';
import 'package:neeleez_flutter_app/config/pref_constant.dart';
import 'package:neeleez_flutter_app/config/preference.dart';
import 'package:neeleez_flutter_app/config/url.dart';
import 'package:neeleez_flutter_app/models/user_data.dart';
import 'package:stacked/stacked.dart';

class DashboardViewModel extends BaseViewModel {
  UserData get user => userData ?? const UserData();
  UserData? userData;
  DashboardViewModel({this.userData}) {
    loadItems();
  }

  // Add ViewModel specific code here
  Future<void> loadItems() async {
    setBusy(true);
    userData ??= await getUserData();
    //Write your models loading codes here

    //Let other views to render again
    setBusy(false);
    notifyListeners();
  }

  void setUserData(UserData? user) {
    userData = user;
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

Future<UserData?> getUserData() async {
  try {
    String? id = SharedPreferenceHelper.getString(Preferences.customerId);
    final res = await apiRepository.apiGet(url: '${Url.customerById}/$id');
    if (res != null) {
      return UserData.fromJson(res);
    }
  } catch (e) {
    log("Error===========>$e");
  } finally {
    log("===========>finally");
  }
  return null;
}
