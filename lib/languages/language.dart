import 'dart:convert';
import 'dart:io';

// import 'package:get/get.dart';
// import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:neeleez_flutter_app/languages/en.dart';
import 'package:neeleez_flutter_app/languages/pb.dart';
import 'package:neeleez_flutter_app/languages/ur.dart';
import 'package:neeleez_flutter_app/models/language_model.dart';

class LocalLanguage extends Translations {
  LocalLanguage();
  @override
  Map<String, Map<String, String>> get keys => {
        // 'ar': ARLanguage().map,
        'en': EnLanguage().map,
        'pb': PbLanguage().map,
        'ur': URLanguage().map,
      };
}

// Future<LanguageModel> languageModel({String? fileName}) async {
//   LanguageModel? body;
//   late String response;
//   if (fileName != null) {
//     response = await File('./json/language/$fileName.json').readAsString();
//   } else {
//     response = await File('./json/language/en_US.json').readAsString();
//   }
//   List data = jsonDecode(response.toString());
//   Map<String, String> obj = {};
//   for (Map element in data) {
//     String name = element['name'];
//     String value = element['value'].toString();
//     obj.addAll({name: value});
//   }
//   return LanguageModel.fromJson(obj);
// }

// class ARLanguage {}
