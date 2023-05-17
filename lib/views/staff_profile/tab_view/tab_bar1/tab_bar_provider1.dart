import 'package:flutter/material.dart';

class TabBarProviderOne extends ChangeNotifier {
  int i = 0;

  void count() {
    i = i + 1;
    notifyListeners();
  }
}
