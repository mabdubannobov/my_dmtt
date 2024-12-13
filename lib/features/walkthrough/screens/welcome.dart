import 'package:flutter/material.dart';
import 'package:my_dmtt/constants/app_assets.dart';
import 'package:my_dmtt/constants/app_colors.dart';
import 'package:my_dmtt/constants/app_text_styles.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(24, 48, 24, 14),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.images.welcomeBg),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Xush kelibsiz!",
                    style: AppTextStyles.boldStyle.copyWith(fontSize: 48, color: AppColors.primaryLight),
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    AppAssets.images.welcomeHi,
                    width: 48,
                  ),
                ],
              ),
              Text(
                "MyDMTT - Davlat maktabgacha ta'lim muassasalariga oziq-ovqat yetkazib berish tizimi",
                style: AppTextStyles.mediumStyle.copyWith(fontSize: 18, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
