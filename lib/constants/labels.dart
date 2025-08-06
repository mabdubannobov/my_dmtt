import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_dmtt/features/attendance/screens/attendance.dart';
import 'package:my_dmtt/features/receipt/screens/receipt.dart';

import '../features/account/screens/account.dart';
import '../features/home/screens/home.dart';
import '../features/orders/screens/orders.dart';
import 'app_assets.dart';

List<String> bottomNavBarTitles = [
  "Asosiy",
  "Buyurtmalar",
  "Taomnoma",
  "Davomat",
  "Hisob",
];

List<Widget> bottomNavBarIcons = [
  SvgPicture.asset(AppAssets.icons.home),
  SvgPicture.asset(AppAssets.icons.document),
  SvgPicture.asset(AppAssets.icons.calendar),
  SvgPicture.asset(AppAssets.icons.chart),
  SvgPicture.asset(AppAssets.icons.profile),
];

List<Widget> bottomNavBarActiveIcons = [
  SvgPicture.asset(AppAssets.icons.homeActive),
  SvgPicture.asset(AppAssets.icons.documentActive),
  SvgPicture.asset(AppAssets.icons.calendarActive),
  SvgPicture.asset(AppAssets.icons.chartActive),
  SvgPicture.asset(AppAssets.icons.profileActive),
];

List<Widget> mainScreenPages = [
  const HomeScreen(),
  const OrdersScreen(),
  const ReceiptScreen(),
  const AttendanceScreen(),
  const AccountScreen(),
];

List<String> categoryImages = [
  AppAssets.images.categorySabzavot,
  AppAssets.images.categoryUn,
  AppAssets.images.categoryDon,
  AppAssets.images.categoryMeat,
  AppAssets.images.categoryQandolat,
  AppAssets.images.categoryMilk,
  AppAssets.images.categoryApple,
  AppAssets.images.categoryOthers,
];

List<String> categoryNames = [
  "Sabzavot",
  "Un mahs..",
  "Yormalar",
  "Go'sht",
  "Qandolat",
  "Sut mah..",
  "Mevalar",
  "Boshqa",
];
