import 'package:flutter/material.dart';
import 'package:my_dmtt/constants/labels.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) {
          setState(() {});
        },
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: mainScreenPages,
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          elevation: 0,
          showUnselectedLabels: true,
          currentIndex: _selectedIndex,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryLight,
          selectedLabelStyle: AppTextStyles.bottomLabelStyle,
          unselectedLabelStyle: AppTextStyles.bottomLabelStyle,
          unselectedItemColor: AppColors.greyscaleLight.shade500,
          onTap: (index) {
            _selectedIndex = index;
            _pageController.jumpToPage(index);
          },
          items: List.generate(
            4,
            (int index) => BottomNavigationBarItem(
              icon: bottomNavBarIcons[index],
              label: bottomNavBarTitles[index],
              activeIcon: bottomNavBarActiveIcons[index],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
