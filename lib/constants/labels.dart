import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../features/account/screens/account.dart';
import '../features/cart/screens/cart.dart';
import '../features/home/screens/home.dart';
import '../features/orders/screens/orders.dart';
import 'app_assets.dart';

List<String> bottomNavBarTitles = [
  "Asosiy",
  "Buyurtma",
  "Savat",
  "Hisob",
];

List<Widget> bottomNavBarIcons = [
  SvgPicture.asset(AppAssets.icons.home),
  SvgPicture.asset(AppAssets.icons.document),
  SvgPicture.asset(AppAssets.icons.bag),
  SvgPicture.asset(AppAssets.icons.profile),
];

List<Widget> bottomNavBarActiveIcons = [
  SvgPicture.asset(AppAssets.icons.homeActive),
  SvgPicture.asset(AppAssets.icons.documentActive),
  SvgPicture.asset(AppAssets.icons.bagActive),
  SvgPicture.asset(AppAssets.icons.profileActive),
];

List<Widget> mainScreenPages = [
  const HomeScreen(),
  const OrdersScreen(),
  const CartScreen(),
  const AccountScreen(),
];

List<String> categoryImages = [
  AppAssets.images.categorySabzavot,
  AppAssets.images.categoryUn,
  AppAssets.images.categoryDon,
  AppAssets.images.categoryMeat,
  AppAssets.images.categoryPotato,
  AppAssets.images.categoryMilk,
  AppAssets.images.categoryApple,
  AppAssets.images.categoryOthers,
];

List<String> categoryNames = [
  "Sabzavot",
  "Un mah..",
  "Don ma..",
  "Go'sht",
  "Poliz ek..",
  "Sut ma..",
  "Mevalar",
  "Boshqa",
];
