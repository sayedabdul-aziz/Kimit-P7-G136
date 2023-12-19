import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati_app_9_12/core/storage/task_model.dart';
import 'package:taskati_app_9_12/core/utils/app_colors.dart';
import 'package:taskati_app_9_12/core/utils/styles.dart';
import 'package:taskati_app_9_12/features/splash_view.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('task');
  await Hive.openBox('user');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        darkTheme: ThemeData(
            appBarTheme: AppBarTheme(
                backgroundColor: AppColors.darkScaffoldBg,
                elevation: 0.0,
                titleTextStyle: getTitleStyle(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
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
        theme: ThemeData(
            scaffoldBackgroundColor: AppColors.whiteColor,
            appBarTheme: AppBarTheme(
                backgroundColor: AppColors.whiteColor,
                elevation: 0.0,
                titleTextStyle: getTitleStyle(
                    color: AppColors.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
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
