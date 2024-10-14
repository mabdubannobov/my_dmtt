import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            children: [
              Text(
                title,
                style: AppTextStyles.boldStyle.copyWith(
                  fontSize: 20,
                  height: 1.2,
                  color: AppColors.greyscaleLight,
                ),
              ),
              const Spacer(),
              Text(
                "Hammasi",
                style: AppTextStyles.boldStyle.copyWith(
                  fontSize: 16,
                  height: 1.4,
                  letterSpacing: 0.2,
                  color: AppColors.primaryLight,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
