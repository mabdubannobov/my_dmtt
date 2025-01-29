import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_dmtt/constants/app_assets.dart';
import 'package:my_dmtt/constants/app_colors.dart';
import 'package:my_dmtt/constants/app_text_styles.dart';
import 'package:my_dmtt/features/walkthrough/screens/welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

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

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
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
      double bubbleRadius = maxBubbleRadius * (0.5 + 0.5 * (1 - cos(phase * pi)));

      canvas.drawCircle(Offset(dx, dy), bubbleRadius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
