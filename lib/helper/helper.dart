import 'package:get/get.dart';

class Helper {
  Helper._();
}





// extension NumberParsing on String {
//   int parseInt() {
//     return int.parse(this);
//   }
//   // ···
// }


extension NumberParsing on num {
  /// Calculates the height depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's height
  double get h => this * Get.height / 100;

  /// Calculates the width depending on the device's screen size
  ///
  /// Eg: 20.w -> will take 20% of the screen's width
  double get w => this * Get.width / 100;

  /// Calculates the sp (Scalable Pixel) depending on the device's screen size
  double get sp => this * (Get.width / 3) / 100;
}
