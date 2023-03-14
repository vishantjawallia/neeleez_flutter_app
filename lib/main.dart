import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neeleez_flutter_app/config/config.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/screens/splash.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: APP_NAME,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'), // English
            Locale('es'), // Spanish
          ],
          theme: ThemeData(
            textTheme: TextTheme(
              headline1: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 26, color: Palettes.white),
              headline2: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 24, color: Palettes.white),
              headline3: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 22, color: Palettes.white),
              headline4: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 20, color: Palettes.white),
              headline5: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 18, color: Palettes.white),
              headline6: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16, color: Palettes.white),
              bodyText1: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 15, color: Palettes.white),
              bodyText2: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 14, color: Palettes.white),
            ),
            primaryColor: Palettes.red,
          ),
          home: const Splash(),
        );
      },
    );
  }
}
