// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neeleez_flutter_app/config/config.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/config/preference.dart';
import 'package:neeleez_flutter_app/languages/language.dart';
import 'package:neeleez_flutter_app/middleware/auth_middleware.dart';
import 'package:neeleez_flutter_app/views/login/login_view.dart';
import 'package:neeleez_flutter_app/views/service_providers/service_providers_view.dart';
import 'package:neeleez_flutter_app/views/splash/splash_view.dart';
import 'core/locator.dart';
import 'core/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/dashboard/dashboard_view.dart';
import 'views/registration/registration_view.dart';
import 'views/main/main_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await LocatorInjector.setupLocator();
  await SharedPreferenceHelper.init();
  // SharedPreferenceHelper.clearPref();

  runApp(
    MultiProvider(
      providers: ProviderInjector.providers,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_NAME,
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      defaultTransition: Transition.rightToLeft,
      translations: LocalLanguage(),
      theme: ThemeData(
        primaryColor: Palettes.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          displayLarge: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 25, color: Palettes.white),
          displayMedium: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 23, color: Palettes.white),
          displaySmall: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 21, color: Palettes.white),
          headlineMedium: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 19, color: Palettes.white),
          headlineSmall: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 17, color: Palettes.white),
          titleLarge: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 15, color: Palettes.white),
          bodyLarge: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 14, color: Palettes.white),
          bodyMedium: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 13, color: Palettes.white),
          bodySmall: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12, color: Palettes.white),
        ),
        // textTheme: ThemeData.dark().textTheme.copyWith(
        //       displayLarge: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 25, color: Palettes.white),
        //       displayMedium: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 23, color: Palettes.white),
        //       displaySmall: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 21, color: Palettes.white),
        //       headlineMedium: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 19, color: Palettes.white),
        //       headlineSmall: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 17, color: Palettes.white),
        //       titleLarge: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 15, color: Palettes.white),
        //       bodyLarge: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 14, color: Palettes.white),
        //       bodyMedium: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 13, color: Palettes.white),
        //       bodySmall: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12, color: Palettes.white),
        //     ),
      ),
      home: const SplashView(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      getPages: [
        GetPage(name: MainView.routeName, page: () => MainView()),
        GetPage(name: LoginView.routeName, page: () => const LoginView()),
        GetPage(name: RegistrationView.routeName, page: () => const RegistrationView()),
        GetPage(name: RegistrationView.routeName, page: () => const RegistrationView()),
        GetPage(name: DashboardView.routeName, page: () => const DashboardView(), middlewares: [AuthMiddleware()]),
      ],
    );
  }
}
