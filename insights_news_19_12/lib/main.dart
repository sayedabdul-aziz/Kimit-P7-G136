import 'package:flutter/material.dart';
import 'package:insights_news_19_12/core/utils/app_colors.dart';
import 'package:insights_news_19_12/core/utils/styles.dart';
import 'package:insights_news_19_12/features/splash_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.scaffoldBg,
          appBarTheme: AppBarTheme(
              centerTitle: true,
              titleTextStyle: getBodyStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.lemonadaColor),
              backgroundColor: AppColors.scaffoldBg,
              elevation: 0.0),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: const TextStyle(color: Colors.grey),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: AppColors.lemonadaColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: AppColors.lemonadaColor)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: AppColors.redColor)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: AppColors.redColor)),
          )),
      home: const SplashView(),
    );
  }
}
