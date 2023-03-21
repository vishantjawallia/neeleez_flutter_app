import 'dart:io';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxInt count = 1.obs;

  void increment() async {
    count++;
  }
}
