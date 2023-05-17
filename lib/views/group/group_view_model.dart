import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

import 'components/alert_popup.dart';

class GroupViewModel extends BaseViewModel {
  bool isAddNew = false;

  TextEditingController searchController = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController nameAr = TextEditingController();

  FocusNode searchFocusNode = FocusNode();

  bool status = false;

  GroupViewModel() {
    searchController.addListener(() => notifyListeners());
    name.addListener(() => notifyListeners());
    nameAr.addListener(() => notifyListeners());
    searchFocusNode.addListener(() => notifyListeners());
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
