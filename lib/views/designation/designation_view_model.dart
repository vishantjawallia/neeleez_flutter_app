import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:neeleez_flutter_app/models/designation/designation.dart';
import 'package:stacked/stacked.dart';

import '../../config/pref_constant.dart';
import '../../config/preference.dart';
import '../../widgets/global_widget.dart';
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

  void onCrossTap(BuildContext _, int designationId) {
    searchFocusNode.unfocus();
    alertPopUp(
      _,
      onYesTap: () async {
        Get.back();
        setBusy(true);
        bool res = await deleteDesignation("$designationId");
        if (res) {
          desList = await getDesignationList(companyId!) ?? [];
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
    if (designation.text.isEmpty) {
      GlobalWidgets.toast('Invalid Field');
      return;
    }
    setBusy(true);
    DateTime dateTime = DateTime.now();
    String formattedDateTime = DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(dateTime.toUtc());
    bool res = await postDesignation(
      0,
      int.parse(companyId!),
      designation.text,
      designationAr.text,
      remark.text,
      formattedDateTime,
      status,
      0,
      0,
    );
    if (res) {
      isAddNew = false;
      desList = await getDesignationList(companyId!) ?? [];
      setBusy(false);
      notifyListeners();
    }
  }

  void statusChanged(bool value) {
    status = value;
    notifyListeners();
  }
}
