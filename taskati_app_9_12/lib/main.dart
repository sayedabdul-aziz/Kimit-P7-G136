import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskati_app_9_12/core/utils/app_colors.dart';
import 'package:taskati_app_9_12/core/utils/styles.dart';
import 'package:taskati_app_9_12/features/splash_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: AppColors.darkScaffoldBg,
      statusBarColor: AppColors.whiteColor));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                titleTextStyle: getTitleStyle(color: AppColors.primaryColor)),
            inputDecorationTheme: InputDecorationTheme(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.redColor),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.redColor),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
            )),
        debugShowCheckedModeBanner: false,
        home: const SplashView());
  }
}
