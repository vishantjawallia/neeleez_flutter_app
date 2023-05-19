import 'package:get/get.dart';
import 'package:neeleez_flutter_app/models/user_data.dart';
import 'package:neeleez_flutter_app/views/department/department_view.dart';
import 'package:neeleez_flutter_app/views/designation/designation_view.dart';
import 'package:neeleez_flutter_app/views/format/format_view.dart';
import 'package:neeleez_flutter_app/views/group/group_view.dart';
import 'package:neeleez_flutter_app/views/service/service_view.dart';
import 'package:neeleez_flutter_app/views/service_composition/service_composition_view.dart';
import 'package:neeleez_flutter_app/views/service_format/service_format_view.dart';

import 'package:stacked/stacked.dart';

import '../../components/dailogs/warning_popup.dart';

class DataListingViewModel extends BaseViewModel {
  UserData? user;
  DataListingViewModel() {
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

  void groupOnTap() {
    Get.to(() => GroupView());
  }

  void formatOnTap() {
    Get.to(() => FormatView());
  }

  void serviceOnTap() {
    Get.to(() => ServiceView());
  }

  void serviceFormatOnTap() {
    Get.to(() => ServiceFormatView());
  }

  void serviceCompositionOnTap() {
    Get.to(() => ServiceCompositionView());
  }

  void serviceOfferOnTap(_) {
    warningPopup(_, head: 'Alert!', dsc: 'This feature is coming soon', btn: 'Close');
  }

  void departmentOnTap() {
    Get.to(() => DepartmentView(user));
  }

  void designationOnTap() {
    Get.to(() => const DesignationView());
  }

  void setUser(UserData? value) {
    user = value;
    notifyListeners();
  }
}
