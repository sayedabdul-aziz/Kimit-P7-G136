import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati_app_9_12/core/utils/app_colors.dart';
import 'package:taskati_app_9_12/core/utils/styles.dart';
import 'package:taskati_app_9_12/features/home/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    // delay by 4 sec and navigate to upload

    Future.delayed(const Duration(seconds: 4), () {
      // navigation
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomeView(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/logo.json', width: 250),
          const Gap(10),
          Text(
            'Taskati',
            style: getBodyStyle(fontSize: 26),
          ),
          // const SizedBox(height: 10),
          const Gap(10),
          Text('It\'s time to be organized',
              style: getSmallStyle(color: AppColors.greyColor)),
        ],
      )),
    );
  }
}
