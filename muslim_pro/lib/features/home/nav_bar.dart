import 'package:flutter/material.dart';
import 'package:muslim_pro/core/utils/colors.dart';
import 'package:muslim_pro/features/home/home_view.dart';
import 'package:muslim_pro/features/quran/quran_view.dart';
import 'package:muslim_pro/features/settings/settings_view.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 0;

  List<Widget> views = [
    const HomeView(),
    const QuranView(),
    const SettingsView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[index],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Colors.grey,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: ''),
            BottomNavigationBarItem(
                activeIcon: Image.asset('assets/quran_nav.png',
                    color: AppColors.primary, height: 40),
                icon: Image.asset('assets/quran_nav.png',
                    color: Colors.grey, height: 40),
                label: ''),
            const BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: ''),
          ]),
    );
  }
}
