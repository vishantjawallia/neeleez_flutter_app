import 'package:get/get.dart';
import 'package:neeleez_flutter_app/languages/en.dart';
import 'package:neeleez_flutter_app/languages/pb.dart';
import 'package:neeleez_flutter_app/languages/ur.dart';

class LocalLanguage extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': EnLanguage().map,
        'pb_IN': PbLanguage().map,
        'ur_IN': URLanguage().map,
      };
}
