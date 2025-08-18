import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bolajon_taminoti/constants/app_assets.dart';
import 'package:bolajon_taminoti/constants/app_colors.dart';
import 'package:bolajon_taminoti/constants/app_text_styles.dart';
import 'package:bolajon_taminoti/features/main_screen.dart';
import 'package:bolajon_taminoti/features/signin/screens/sign_in.dart';
import 'package:bolajon_taminoti/features/walkthrough/screens/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _checkUserStatus();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  Future<void> _checkUserStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final bool isFirstLaunch = prefs.getBool('first_launch') ?? true;
    final bool isAuthenticated = prefs.getBool('is_authenticated') ?? false;

    await Future.delayed(
        const Duration(seconds: 2)); // Splash Screen animatsiyasi

    if (isFirstLaunch) {
      await prefs.setBool('first_launch', false);
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      );
    } else if (isAuthenticated) {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    } else {
      // Aks holda Welcome Screen ochiladi
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const SignInScreen()),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              SvgPicture.asset(
                AppAssets.icons.appBarLogo,
                width: 60,
                height: 60,
              ),
              const SizedBox(width: 16),
              Text(
                "Bolajon Taminoti",
                style: AppTextStyles.boldStyle.copyWith(fontSize: 40),
              ),
              const Spacer(),
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return CustomPaint(
                    painter: BubblePainter(_animation.value),
                    size: const Size(60, 60),
                  );
                },
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

class BubblePainter extends CustomPainter {
  final double progress;

  BubblePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primaryLight
      ..style = PaintingStyle.fill;

    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double orbitRadius = size.width / 2.7;
    double maxBubbleRadius = size.width / 12;

    double startAngle = -pi / 2;

    for (int i = 0; i < 7; i++) {
      double angle = i * (2 * pi / 7) + progress * 2 * pi + startAngle;
      double dx = centerX + orbitRadius * cos(angle);
      double dy = centerY + orbitRadius * sin(angle);

      double phase = (progress + i / 7) % 1;
      double bubbleRadius =
          maxBubbleRadius * (0.5 + 0.5 * (1 - cos(phase * pi)));

      canvas.drawCircle(Offset(dx, dy), bubbleRadius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
