// ignore_for_file: prefer_const_constructors

import 'package:expense_clean_code/core/constant/app_route.dart';
import 'package:expense_clean_code/core/di/main_binding.dart';
import 'package:expense_clean_code/presentation/screen/home/Home_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: AppTheme.red(),
      // locale: AppLocalization.locale,
      // fallbackLocale: AppLocalization.fallbackLocale,
      // translations: AppLocalization(),
      initialBinding: MainBinding(),
      // initialRoute: AppConfig.welcomeScreenStartUp == true
      //     ? RouteName.language
      //     : RouteName.home,

      initialRoute: AppRoute.home,

      getPages: [
        GetPage(
          name: AppRoute.home,
          page: () => HomeScreen(),
        ),
      ],
    );
  }
}
