import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:muslim_pro/core/functions/routing.dart';
import 'package:muslim_pro/core/utils/colors.dart';
import 'package:muslim_pro/core/utils/styles.dart';
import 'package:muslim_pro/features/azkar/azkar_view.dart';
import 'package:muslim_pro/features/home/tadbour_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  pushTo(context, const AzkarView());
                },
                child: Container(
                  height: 100,
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(.4),
                      borderRadius: BorderRadius.circular(15)),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: -40,
                        left: -10,
                        child: Image.asset(
                          'assets/quran_nav.png',
                          color: AppColors.primary.withOpacity(.4),
                          height: 120,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 40),
                        height: 100,
                        width: double.infinity,
                        child: Text(
                          'الاذكار والادعية',
                          style: getTitleStyle(
                              fontSize: 24, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(20),
              GestureDetector(
                onTap: () {
                  pushTo(context, const TadbourView());
                },
                child: Container(
                  height: 100,
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(.4),
                      borderRadius: BorderRadius.circular(15)),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: -40,
                        left: -10,
                        child: Image.asset(
                          'assets/quraan-bottom.png',
                          color: AppColors.primary.withOpacity(.4),
                          height: 120,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 40),
                        height: 100,
                        width: double.infinity,
                        child: Text(
                          'تدبّر ايات من القران',
                          style: getTitleStyle(
                              fontSize: 24, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
