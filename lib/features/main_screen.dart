import 'package:flutter/material.dart';
import 'package:my_dmtt/constants/labels.dart';

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
      body: SafeArea(
        child: PageView(
          onPageChanged: (index) {
            setState(() {});
          },
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: mainScreenPages,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
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
    );
  }
}
