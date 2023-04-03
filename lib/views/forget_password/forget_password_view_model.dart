import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class ForgetPasswordViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  bool loading;

  ForgetPasswordViewModel(this.loading) {
    emailController.addListener(() {
      notifyListeners();
    });
    loadItems();
  }

  // Add ViewModel specific code here
  Future<void> loadItems() async {
    // if(loading)
    setBusy(loading);
    //Write your models loading codes here

    //Let other views to render again
    Future.delayed(const Duration(seconds: 1), () {
      setBusy(false);
    });
    notifyListeners();
  }

  void sendHandler() {}
}
