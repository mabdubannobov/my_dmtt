import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Image(
            image: AssetImage(image),
            height: 360,
          ),
          const Spacer(),
          Text(
            title,
            style: AppTextStyles.boldStyle.copyWith(fontSize: 46, color: AppColors.primaryLight.shade400),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: AppTextStyles.mediumStyle.copyWith(
              fontSize: 18,
              color: AppColors.greyscaleLight,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
