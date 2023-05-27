import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class Helper {
  Helper._();

  static isRtl() {
    try {
      bool value = false;
      var code = Get.locale!.languageCode;
      return rtlLanguages.contains(code) ? false : true;
    } catch (e) {
      return true;
    }
  }

  static mapLoop(Map<String, dynamic> value) {
    value.forEach((key, value) {
      log('"$key" : "$value"');
    });
  }

  static Future<bool> getLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return false;
        }
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  // static Future<LanguageModel> getLanguage({String? fileName}) async {
  //   LanguageModel? body;
  //   final String response =
  //       // if (fileName != null) {
  //       //   response = await File('./json/language/$fileName.json').readAsString();
  //       // } else {
  //       //   response = await File('./json/language/en_US.json').readAsString();
  //       // }
  //       // response =
  //       await File('./json/language/en.json').readAsString();
  //   List data = jsonDecode(response.toString());
  //   Map<String, String> obj = {};
  //   for (Map element in data) {
  //     String name = element['name'];
  //     String value = element['value'].toString();
  //     obj.addAll({name: value});
  //   }
  //   LanguageModel languageModel = LanguageModel.fromJson(obj);
  //   // Locale? local = Locale("${dd["language_code"]}", "${dd["country_code"]}");
  //   // Get.updateLocale(local);
  //   // await SharedPreferenceHelper.setString(Preferences.languageModel, data.toString());
  //   return languageModel;
  // }
}

// extension NumberParsing on String {
//   int parseInt() {
//     return int.parse(this);
//   }
//   // ···
// }

// void main(List<String> args) async {
//   // LanguageModel? model = await Helper.getLanguage(fileName: "en");
//   loadI();
// }

// void loadI() async {
//   LanguageModel? model = await Helper.getLanguage(fileName: "en");
//   final Directory directory = await getApplicationDocumentsDirectory();
//   final File file = File('${directory.path}/en.json');
//   await file.writeAsString(model.toJson().toString());
// }

// getApplicationDocumentsDirectory() {}

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

extension StringParsing on String {
  /// Calculates the height depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's height
  // String get str => Helper.isRtl()?;

  // /// Calculates the width depending on the device's screen size
  // ///
  // /// Eg: 20.w -> will take 20% of the screen's width
  // double get w => this * Get.width / 100;

  // /// Calculates the sp (Scalable Pixel) depending on the device's screen size
  // double get sp => this * (Get.width / 3) / 100;
}
// class LocaleString extends GetX {
//   /// Calculates the height depending on the device's screen size
//   ///
//   /// Eg: 20.h -> will take 20% of the screen's height
//   Future<bool>  => this ;

//   /// Calculates the width depending on the device's screen size
//   ///
//   /// Eg: 20.w -> will take 20% of the screen's width
//   double get w => this * Get.width / 100;

//   /// Calculates the sp (Scalable Pixel) depending on the device's screen size
//   double get sp => this * (Get.width / 3) / 100;
// }
