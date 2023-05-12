import 'package:flutter/material.dart';
import 'package:neeleez_flutter_app/views/company_profile/company_profile_view_model.dart';

class ContactPersonInfoProvider<E> extends ChangeNotifier{
  TextEditingController mobileNo = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController fullName = TextEditingController();

  bool departmentEnabled = false;
  bool designationEnabled = false;

  TextEditingController designationController = TextEditingController();

  TextEditingController departmentController = TextEditingController();

  ContactPersonInfoProvider() {
    mobileNo.addListener(() => notifyListeners());
    email.addListener(() => notifyListeners());
    fullName.addListener(() => notifyListeners());
    designationController.addListener(() => notifyListeners());
    departmentController.addListener(() => notifyListeners());
  }

  void loadItems() {}

  void designationOnTap() {
    designationEnabled = !designationEnabled;
    notifyListeners();
  }

  void departmentOnTap() {
    departmentEnabled = !departmentEnabled;
    notifyListeners();
  }

  void kk() async {
    CompanyProfileViewModel kk = CompanyProfileViewModel();
    kk.setBusy(true);
    await Future.delayed(const Duration(seconds: 3));
    kk.setBusy(false);
  }
}
