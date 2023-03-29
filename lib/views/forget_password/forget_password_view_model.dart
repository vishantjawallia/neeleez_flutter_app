import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class ForgetPasswordViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();

  ForgetPasswordViewModel() {
    emailController.addListener(() {
      notifyListeners();
    });
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

  void sendHandler() {}
}
