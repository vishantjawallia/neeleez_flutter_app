import 'package:flutter/material.dart';

class GeneralInfoProvider extends ChangeNotifier {
  ScrollController scrollController = ScrollController();
  GeneralInfoProvider() {
    scrollController.addListener(() {
      notifyListeners();
    });
  }

  void load() async {}
}
