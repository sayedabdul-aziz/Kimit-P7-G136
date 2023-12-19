import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news_19_12/core/storage/local_storage.dart';
import 'package:insights_news_19_12/core/utils/app_colors.dart';
import 'package:insights_news_19_12/core/utils/styles.dart';
import 'package:insights_news_19_12/features/home/home_view.dart';
import 'package:insights_news_19_12/features/upload/upload_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool? isUpload;
  @override
  void initState() {
    super.initState();

    AppLocalStorage.getCachedData(AppLocalStorage.IS_UPLOAD).then((value) {
      isUpload = value ?? false;
    });
    // delay by 4 sec and navigate to upload
    Future.delayed(const Duration(seconds: 4), () {
      // navigation
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => isUpload! ? const HomeView() : const UploadView(),
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
          Image.asset('assets/logo.png', width: 250),
          const Gap(10),
          Text(
            'Insights News',
            style: getBodyStyle(fontSize: 26),
          ),
          // const SizedBox(height: 10),
          const Gap(10),
          Text('Stay Informed, Anytime, Anywhere.',
              style:
                  getSmallStyle(color: AppColors.whiteColor.withOpacity(.5))),
        ],
      )),
    );
  }
}
