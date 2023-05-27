// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/config.dart';
import 'package:neeleez_flutter_app/config/preference.dart';
import 'package:neeleez_flutter_app/middleware/auth_middleware.dart';
import 'package:neeleez_flutter_app/theme/theme.dart';
import 'package:neeleez_flutter_app/views/login/login_view.dart';
import 'package:neeleez_flutter_app/views/splash/splash_view.dart';
import 'core/locator.dart';
import 'core/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'languages/language.dart';
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
      child:
          //  DevicePreview(
          // enabled: !kReleaseMode,
          // builder:
          // (context) =>
          MyApp(), // Wrap your app
      // ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_NAME,
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      defaultTransition: Transition.rightToLeft,
      // supportedLocales: [

      // ],
      // translations: LocalLanguage(),
      useInheritedMediaQuery: true,
      theme: CustomTheme.light,
      navigatorObservers: [
        BotToastNavigatorObserver(),
      ],
      builder: (context, myWidget) {
        myWidget = BotToastInit()(context, myWidget);
        // myWidget = DevicePreview.appBuilder(context, myWidget);
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: myWidget,
        );
      },
      home: const SplashView(),
      getPages: [
        GetPage(name: MainView.routeName, page: () => MainView()),
        GetPage(name: LoginView.routeName, page: () => const LoginView()),
        GetPage(name: RegistrationView.routeName, page: () => const RegistrationView()),
        GetPage(name: RegistrationView.routeName, page: () => const RegistrationView()),
        GetPage(
          name: DashboardView.routeName,
          page: () => const DashboardView(),
          middlewares: [AuthMiddleware()],
        ),
      ],
    );
  }
}
