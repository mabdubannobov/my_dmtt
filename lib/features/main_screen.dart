import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_assets.dart';
import '../constants/app_colors.dart';
import 'account/screens/account.dart';
import 'cart/screens/cart.dart';
import 'home/screens/home.dart';
import 'orders/screens/orders.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController();
  late final List<Widget> pages = [
    const HomeScreen(),
    const OrdersScreen(),
    const CartScreen(),
    const AccountScreen(),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: pages,
        onPageChanged: (index) {
          setState(() {});
        },
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedItemColor: AppColors.primaryLight,
          unselectedItemColor: AppColors.greyscaleLight.shade500,
          // unselectedLabelStyle: AppTextStyles.bottomLabelStyle,
          // selectedLabelStyle: AppTextStyles.bottomLabelStyle,
          backgroundColor: Colors.white,
          elevation: 0,
          currentIndex: _selectedIndex,
          onTap: (index) {
            _selectedIndex = index;
            _pageController.jumpToPage(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.icons.home),
              activeIcon: SvgPicture.asset(AppAssets.icons.homeActive),
              label: 'Asosiy',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.icons.document),
              activeIcon: SvgPicture.asset(AppAssets.icons.documentActive),
              label: 'Buyurtma',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.icons.bag),
              activeIcon: SvgPicture.asset(AppAssets.icons.bagActive),
              label: 'Savat',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppAssets.icons.profile),
              activeIcon: SvgPicture.asset(AppAssets.icons.profileActive),
              label: 'Hisob',
            ),
          ],
        ),
      ),
    );
  }
}
