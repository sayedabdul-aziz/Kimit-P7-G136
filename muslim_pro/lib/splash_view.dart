import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:muslim_pro/core/functions/routing.dart';
import 'package:muslim_pro/core/utils/styles.dart';
import 'package:muslim_pro/features/home/nav_bar.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      pushToWithReplacment(context, const NavBar());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              height: 250,
            ),
            Text(
              'اسلامي',
              style: getBodyStyle(fontSize: 26),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            const Gap(10),
            Text(
              'تجربة دينية ممتعة',
              style: getSmallStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
