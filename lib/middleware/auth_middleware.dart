import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/views/login/login_view.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // print('redirect');
    var func = Get.arguments ?? () {};
    if (func is Function) {
      func.call();
    }
    const RouteSettings(name: LoginView.routeName);
    return null;
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    Get.log("======>x");
    return null;
  }
}
