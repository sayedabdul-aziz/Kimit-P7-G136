import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety_app_1_9/core/utils/colors.dart';
import 'package:se7ety_app_1_9/core/utils/styles.dart';
import 'package:se7ety_app_1_9/features/on-boarding/onboarding_model.dart';
import 'package:se7ety_app_1_9/features/welcome_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  var pageController = PageController();
  int curruntPage = 0;

  List<OnboardingModel> pages = [
    OnboardingModel(
        image: 'assets/on1.png',
        title: 'ابحث عن دكتور متخصص',
        desc:
            'اكتشف مجموعة واسعة من الأطباء الخبراء والمتخصصين في مختلف المجالات.'),
    OnboardingModel(
        image: 'assets/on2.png',
        title: 'سهولة الحجز',
        desc: 'احجز المواعيد بضغطة زرار في أي وقت وفي أي مكان.'),
    OnboardingModel(
        image: 'assets/on3.png',
        title: 'آمن وسري',
        desc: 'كن مطمئنًا لأن خصوصيتك وأمانك هما أهم أولوياتنا.')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const WelcomeView(),
              ));
            },
            child: Text(
              'تخطي',
              style: getbodyStyle(color: AppColors.color1),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
                child: PageView.builder(
              controller: pageController,
              itemCount: pages.length,
              onPageChanged: (value) {
                setState(() {
                  curruntPage = value;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const Spacer(
                      flex: 1,
                    ),
                    Image.asset(
                      pages[index].image,
                      width: 300,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      pages[index].title,
                      style: getTitleStyle(),
                    ),
                    const Gap(20),
                    Text(
                      pages[index].desc,
                      textAlign: TextAlign.center,
                      style: getbodyStyle(),
                    ),
                    const Spacer(
                      flex: 4,
                    ),
                  ],
                );
              },
            )),
            Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                height: 50,
                child: Row(
                  children: [
                    SmoothPageIndicator(
                        onDotClicked: (index) {
                          pageController.animateToPage(index,
                              duration: const Duration(milliseconds: 600),
                              curve: Curves.easeInOut);
                        },
                        effect: WormEffect(
                            activeDotColor: AppColors.color1,
                            dotHeight: 12,
                            dotWidth: 20),
                        controller: pageController,
                        count: 3),
                    const Spacer(),
                    if (curruntPage == pages.length - 1)
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.color1,
                              foregroundColor: AppColors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => const WelcomeView(),
                            ));
                          },
                          child: const Text('هيا بنا'))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
