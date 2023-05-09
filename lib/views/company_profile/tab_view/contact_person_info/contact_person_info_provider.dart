import 'package:flutter/material.dart';

class ContactPersonInfoProvider extends ChangeNotifier {
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
}
