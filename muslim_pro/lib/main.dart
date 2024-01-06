import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim_pro/core/utils/colors.dart';
import 'package:muslim_pro/core/utils/styles.dart';
import 'package:muslim_pro/splash_view.dart';

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
          scrollbarTheme: ScrollbarThemeData(
              thumbColor: MaterialStatePropertyAll(AppColors.primary)),
          fontFamily: GoogleFonts.cairo().fontFamily,
          appBarTheme:
              AppBarTheme(centerTitle: true, titleTextStyle: getTitleStyle())),
      home: const SplashView(),
      builder: (context, child) {
        return Directionality(textDirection: TextDirection.rtl, child: child!);
      },
    );
  }
}
