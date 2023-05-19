import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/models/designation/designation.dart';
import 'package:stacked/stacked.dart';

import '../../config/pref_constant.dart';
import '../../config/preference.dart';
import 'components/alert_popup.dart';
import 'service/designation_service.dart';

// import 'components/alert_popup.dart';

class DesignationViewModel extends BaseViewModel with DesignationService {
  bool isAddNew = false;
  TextEditingController searchController = TextEditingController();
  TextEditingController designation = TextEditingController();
  TextEditingController designationAr = TextEditingController();
  TextEditingController remark = TextEditingController();
  bool status = true;
  List<Designation>? desList;

  String? companyId = SharedPreferenceHelper.getString(Preferences.companyId);
  String? countryId = SharedPreferenceHelper.getString(Preferences.countryId);
  FocusNode searchFocusNode = FocusNode();
  // FocusNode department = FocusNode();
  // FocusNode departmentAr = FocusNode();

  DesignationViewModel() {
    loadItems();
    searchController.addListener(() => notifyListeners());
    remark.addListener(() => notifyListeners());
    // focusNode
    searchFocusNode.addListener(() => notifyListeners());
  }

  // Add ViewModel specific code here
  Future<void> loadItems() async {
    setBusy(true);
    //Write your models loading codes here
    desList ??= await getDesignationList(companyId!) ?? [];
    //Let other views to render again
    setBusy(false);
    notifyListeners();
  }

  void onCrossTap(BuildContext _) {
    searchFocusNode.unfocus();
    alertPopUp(_);
  }

  void onSingleItemTap() {
    isAddNew = !isAddNew;
    notifyListeners();
  }

  void addNewTap() {
    isAddNew = !isAddNew;
    notifyListeners();
  }

  void backOnTap() {
    if (isAddNew) {
      addNewTap();
    } else {
      Get.back();
    }
  }

  void saveOnTap() {}

  void statusChanged(bool value) {
    status = value;
    notifyListeners();
  }
}
