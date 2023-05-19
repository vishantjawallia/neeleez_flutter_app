import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:neeleez_flutter_app/models/department/department.dart';
import 'package:neeleez_flutter_app/models/user_data.dart';
import 'package:neeleez_flutter_app/views/department/service/department_service.dart';
import 'package:neeleez_flutter_app/widgets/global_widget.dart';
import 'package:stacked/stacked.dart';

import '../../config/pref_constant.dart';
import '../../config/preference.dart';
import 'components/alert_popup.dart';

class DepartmentViewModel extends BaseViewModel with DepartmentService {
  final UserData? user;
  bool isAddNew = false;
  TextEditingController searchController = TextEditingController();
  TextEditingController department = TextEditingController();
  TextEditingController departmentAr = TextEditingController();
  bool status = true;
  Department? obj;
  List<Department>? departList;

  String? companyId = SharedPreferenceHelper.getString(Preferences.companyId);
  String? countryId = SharedPreferenceHelper.getString(Preferences.countryId);

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
    departList ??= await getDepartment(companyId!);
    //Let other views to render again
    setBusy(false);
    notifyListeners();
  }

  void onCrossTap(BuildContext _, int depId) {
    searchFocusNode.unfocus();
    alertPopUp(
      _,
      onYesTap: () async {
        Get.back();
        setBusy(true);
        bool res = await deleteDepartment("$depId");
        if (res) {
          departList = await getDepartment(companyId!);
          setBusy(false);
          notifyListeners();
        }
      },
    );
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
    setBusy(true);
    DateTime dateTime = DateTime.now();
    String formattedDateTime = DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(dateTime.toUtc());
    bool res = await postDepartment(
      0,
      department.text,
      departmentAr.text,
      int.parse(companyId!),
      status,
      formattedDateTime,
      0,
      0,
    );
    if (res) {
      isAddNew = false;
      departList = await getDepartment(companyId!) ?? [];
      setBusy(false);
      notifyListeners();
    }
  }

  void statusChanged(bool value) {
    status = value;
    notifyListeners();
  }
}
