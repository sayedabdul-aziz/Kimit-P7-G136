import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insights_news_19_12/core/utils/app_colors.dart';
import 'package:insights_news_19_12/features/news/news_view.dart';
import 'package:insights_news_19_12/features/search/search_view.dart';
import 'package:insights_news_19_12/features/source/source_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> screens = [
    const NewsView(),
    const SearchView(),
    const SourceView(),
    Center(
      child: Text(
        'profile',
        style: TextStyle(color: AppColors.lemonadaColor),
      ),
    ),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: screens[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.scaffoldBg,
          // selectedItemColor: AppColors.lemonadaColor,
          // unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/home.svg'),
              activeIcon: SvgPicture.asset('assets/home.svg',
                  colorFilter: ColorFilter.mode(
                      AppColors.lemonadaColor, BlendMode.srcIn)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/search.svg'),
              activeIcon: SvgPicture.asset('assets/search.svg',
                  colorFilter: ColorFilter.mode(
                      AppColors.lemonadaColor, BlendMode.srcIn)),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/source.svg'),
              activeIcon: SvgPicture.asset('assets/source.svg',
                  colorFilter: ColorFilter.mode(
                      AppColors.lemonadaColor, BlendMode.srcIn)),
              label: 'Source',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/profile.svg'),
              activeIcon: SvgPicture.asset('assets/profile.svg',
                  colorFilter: ColorFilter.mode(
                      AppColors.lemonadaColor, BlendMode.srcIn)),
              label: 'Profile',
            ),
          ]),
    );
  }
}
