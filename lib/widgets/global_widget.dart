import 'package:bot_toast/bot_toast.dart';
// import 'package:building_tap/theme/palettes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/palettes.dart';

class GlobalWidgets {
  // toast
  static toast(value, {Color? contentColor}) {
    return BotToast.showText(
      text: value,
      textStyle: Get.textTheme.titleSmall!.copyWith(color: Palettes.white, fontWeight: FontWeight.w500),
      // contentColor: contentColor ?? Colors.black54,
    );
  }
}
