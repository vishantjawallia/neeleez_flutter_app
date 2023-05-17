import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import 'components/alert_popup.dart';

// import 'components/alert_popup.dart';

class DesignationViewModel extends BaseViewModel {
  bool isAddNew = false;
  TextEditingController searchController = TextEditingController();
  TextEditingController designation = TextEditingController();
  TextEditingController designationAr = TextEditingController();
  TextEditingController remark = TextEditingController();
  bool status = true;

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
