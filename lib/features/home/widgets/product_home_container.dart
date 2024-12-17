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
    required this.productSeller,
    required this.productMeasure,
  });

  final String productImage;
  final String productTitle;
  final double productQuantity;
  final String productSeller;
  final String productMeasure;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 337,
      width: 220,
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 16),
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
          CachedNetworkImage(
            width: 192,
            height: 192,
            imageUrl: productImage,
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
              fontSize: 12,
              color: AppColors.greyscaleLight.shade700,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            productSeller,
            style: AppTextStyles.boldStyle.copyWith(
              fontSize: 20,
              color: AppColors.primaryLight,
            ),
            softWrap: false,
          ),
        ],
      ),
    );
  }
}
