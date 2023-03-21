// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neeleez_flutter_app/config/config.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/config/preference.dart';
import 'package:neeleez_flutter_app/languages/language.dart';
import 'package:neeleez_flutter_app/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceHelper.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_NAME,
      translations: LocalLanguage(),
      locale: const Locale('en', 'US'),
      // locale: Get.deviceLocale,

      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 25, color: Palettes.white),
          headline2: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 23, color: Palettes.white),
          headline3: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 21, color: Palettes.white),
          headline4: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 19, color: Palettes.white),
          headline5: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 17, color: Palettes.white),
          headline6: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 15, color: Palettes.white),
          bodyText1: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 14, color: Palettes.white),
          bodyText2: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 13, color: Palettes.white),
          // headline1: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 26, color: Palettes.white),
          // headline2: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 24, color: Palettes.white),
          // headline3: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 22, color: Palettes.white),
          // headline4: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 20, color: Palettes.white),
          // headline5: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 18, color: Palettes.white),
          // headline6: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16, color: Palettes.white),
          // bodyText1: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 15, color: Palettes.white),
          // bodyText2: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 14, color: Palettes.white),
        ),
        primaryColor: Palettes.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
    );
  }
}


// Text('logged_in'.trParams({
//   'name': 'Jhon',
//   'email': 'jhon@example.com'
//   }));


      //  onPressed: () => Get.updateLocale(const Locale('ko', 'KR')),