import 'package:flutter/material.dart';

class ContactPersonInfoProvider extends ChangeNotifier {
  TextEditingController mobileNo = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController fullName = TextEditingController();

  ContactPersonInfoProvider() {
    mobileNo.addListener(() => notifyListeners());
    email.addListener(() => notifyListeners());
    fullName.addListener(() => notifyListeners());
  }
}
