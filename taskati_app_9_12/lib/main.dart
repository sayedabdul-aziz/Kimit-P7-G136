import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskati_app_9_12/core/utils/app_colors.dart';
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
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: SplashView());
  }
}
