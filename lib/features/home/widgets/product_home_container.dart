import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';

class ProductHomeContainer extends StatelessWidget {
  const ProductHomeContainer({
    super.key,
    required this.productImage,
    required this.productTitle,
    required this.productQuantity,
    required this.productMeasure,
  });

  final String productImage;
  final String productTitle;
  final double productQuantity;
  final String productMeasure;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF04060F).withValues(alpha: 0.05),
            spreadRadius: 0,
            blurRadius: 60,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: CachedNetworkImage(
              imageUrl: productImage,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            productTitle,
            style: AppTextStyles.boldStyle.copyWith(
              fontSize: 20,
              color: AppColors.greyscaleLight,
            ),
            softWrap: false,
          ),
          const SizedBox(height: 14),
          Text(
            "Qoldiqda - $productQuantity $productMeasure",
            style: AppTextStyles.mediumStyle.copyWith(
              fontSize: 14,
              color: AppColors.greyscaleLight.shade700,
            ),
          ),
          const SizedBox(height: 14),
        ],
      ),
    );
  }
}
