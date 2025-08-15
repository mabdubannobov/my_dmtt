import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_dmtt/constants/app_assets.dart';
import 'package:my_dmtt/constants/app_colors.dart';
import 'package:my_dmtt/constants/app_text_styles.dart';
import 'package:my_dmtt/features/walkthrough/screens/walkthrough.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const WalkthroughScreen()),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 48, 24, 48),
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
                      style: AppTextStyles.boldStyle.copyWith(
                          fontSize: 40, color: AppColors.primaryLight),
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      AppAssets.images.welcomeHi,
                      width: 40,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Bolajon Taminoti - Davlat maktabgacha ta'lim muassasalariga oziq-ovqat yetkazib berish tizimi",
                  style: AppTextStyles.mediumStyle
                      .copyWith(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
