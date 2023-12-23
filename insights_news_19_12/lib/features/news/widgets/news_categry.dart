import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news_19_12/core/utils/app_colors.dart';
import 'package:insights_news_19_12/core/utils/styles.dart';
import 'package:insights_news_19_12/features/news/widgets/news_list_builder.dart';

class NewsCategoryWidget extends StatelessWidget {
  const NewsCategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ButtonsTabBar(
                backgroundColor: AppColors.lemonadaColor,
                buttonMargin: const EdgeInsets.symmetric(horizontal: 10),
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                unselectedBackgroundColor: AppColors.containerBg,
                unselectedLabelStyle:
                    getBodyStyle(fontSize: 14, color: AppColors.whiteColor),
                labelStyle:
                    getBodyStyle(fontSize: 14, color: AppColors.blackColor),
                tabs: const [
                  Tab(
                    text: "Science",
                  ),
                  Tab(
                    text: "Entertainment",
                  ),
                  Tab(
                    text: "Sports",
                  ),
                  Tab(
                    text: "Busniess",
                  ),
                ],
              ),
              const Gap(10),
              const Expanded(
                child: TabBarView(
                  children: [
                    NewsListBuilder(),
                    NewsListBuilder(),
                    NewsListBuilder(),
                    NewsListBuilder(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
