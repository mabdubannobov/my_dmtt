import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_dmtt/constants/app_colors.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_text_styles.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: AppBar(
            backgroundColor: Colors.white,
            leading: SvgPicture.asset(AppAssets.icons.appBarLogo),
            leadingWidth: 28,
            title: const Align(
              alignment: Alignment.centerLeft,
              child: Text('Hisob'),
            ),
            titleTextStyle: AppTextStyles.titleStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  width: 80,
                  height: 80,
                  AppAssets.images.userImage,
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Diyorbek Isroilov",
                    style: AppTextStyles.boldStyle.copyWith(fontSize: 20, color: AppColors.greyscaleLight),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "+998 (91) 650-66-26",
                    style: AppTextStyles.mediumStyle.copyWith(fontSize: 16, color: AppColors.greyscaleLight.shade800),
                  ),
                ],
              ),
              const Spacer(),
              SvgPicture.asset(AppAssets.icons.edit),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Divider(
            color: AppColors.greyscaleLight.shade200,
          ),
        ),
        const ListTile()
      ],
    );
  }
}
