import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:neeleez_flutter_app/models/department/department.dart';
import 'package:neeleez_flutter_app/models/user_data.dart';
import 'package:neeleez_flutter_app/views/department/service/department_service.dart';
import 'package:neeleez_flutter_app/widgets/global_widget.dart';
import 'package:stacked/stacked.dart';

import 'components/alert_popup.dart';

class DepartmentViewModel extends BaseViewModel with DepartmentService {
  final UserData? user;
  bool isAddNew = false;
  TextEditingController searchController = TextEditingController();
  TextEditingController department = TextEditingController();
  TextEditingController departmentAr = TextEditingController();
  bool status = true;
  Department? obj;

  FocusNode searchFocusNode = FocusNode();
  // FocusNode department = FocusNode();
  // FocusNode departmentAr = FocusNode();

  DepartmentViewModel(this.user) {
    loadItems();
    searchController.addListener(() => notifyListeners());
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

  void saveOnTap() async {
    if (department.text.isEmpty) {
      GlobalWidgets.toast('Invalid Field');
      return;
    }
    DateTime dateTime = DateTime.now(); // Replace with your desired DateTime

    String formattedDateTime = DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(dateTime.toUtc());
    // print(formattedDateTime);
    bool res = await postDepartment(0, department.text, departmentAr.text, user!.companyId!.toInt(), status, formattedDateTime, 0, 0);
    if (res) {
      isAddNew = false;
      notifyListeners();
    }
  }

  void statusChanged(bool value) {
    status = value;
    notifyListeners();
  }
}
