import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        //ENGLISH LANGUAGE
        'en_US': {
          'businessApp': 'BUSINESS APP',
          'preparingApplicationEnvironment': 'Preparing Application Environment',
          'message': 'Welcome to Proto Coders Point',
          'title': 'Flutter Language - Localization',
          'sub': 'Subscribe Now',
          'changelang': 'Change Language'
        },
        //HINDI LANGUAGE
        'hi_IN': {'businessApp': 'नमस्ते दुनिया', 'message': 'प्रोटो कोडर प्वाइंट में आपका स्वागत है', 'title': 'स्पंदन भाषा - स्थानीयकरण', 'subscribe': 'सब्सक्राइब', 'changelang': 'भाषा बदलो'},
      };
}
