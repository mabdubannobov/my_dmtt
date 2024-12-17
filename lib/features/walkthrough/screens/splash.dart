import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_dmtt/constants/app_assets.dart';
import 'package:my_dmtt/constants/app_text_styles.dart';
import 'package:my_dmtt/features/walkthrough/screens/welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppAssets.icons.appBarLogo,
                  width: 60,
                  height: 60,
                ),
                const SizedBox(width: 16),
                Text(
                  "My DMTT",
                  style: AppTextStyles.boldStyle.copyWith(fontSize: 48),
                ),
              ],
            ),
            const Spacer(),
            SvgPicture.asset(AppAssets.icons.loading),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
