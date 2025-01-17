import 'package:flutter/material.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';

class RejectedOrder extends StatelessWidget {
  const RejectedOrder({
    required this.idOrder,
    required this.itemsCount,
    required this.orderDate,
    super.key,
  });

  final int idOrder;
  final int itemsCount;
  final String orderDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(28),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF04060F).withValues(alpha: 0.05),
            spreadRadius: 0,
            blurRadius: 60,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(24),
              ),
              image: DecorationImage(
                image: AssetImage(AppAssets.images.rejectedOrder),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Buyurtma - #$idOrder',
                style: AppTextStyles.titleStyle.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 14),
              Text(
                '$itemsCount ta mahsulot | ${DateTime.parse(orderDate).day}.${DateTime.parse(orderDate).month}.${DateTime.parse(orderDate).year}',
                style: AppTextStyles.mediumStyle.copyWith(
                  color: AppColors.greyscaleLight.shade700,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 14),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppColors.error),
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                child: Text(
                  'Bekor qilingan',
                  style: AppTextStyles.semiBoldStyle.copyWith(
                    color: AppColors.error,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
