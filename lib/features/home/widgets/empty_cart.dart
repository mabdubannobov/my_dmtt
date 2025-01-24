import 'package:flutter/material.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 74),
            child: Image.asset(
              AppAssets.images.emptyOrder,
            ),
          ),
          const SizedBox(height: 40),
          Text(
            "Bo'sh",
            style: AppTextStyles.boldStyle.copyWith(
              fontSize: 24,
              color: AppColors.greyscaleLight,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Hozirda sizda hech qanday tanlangan mahsulotlar mavjud emas",
              textAlign: TextAlign.center,
              style: AppTextStyles.regularStyle.copyWith(
                fontSize: 18,
                color: AppColors.greyscaleLight,
              ),
            ),
          )
        ],
      ),
    );
  }
}
