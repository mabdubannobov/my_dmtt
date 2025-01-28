import 'package:flutter/material.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';

class ActiveOrder extends StatelessWidget {
  const ActiveOrder({
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
        color: Theme.of(context).primaryColorLight,
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
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(24),
                  ),
                  image: DecorationImage(
                    image: AssetImage(AppAssets.images.acceptedOrder),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Buyurtma - #$idOrder',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 14),
                  Text(
                    '$itemsCount ta mahsulot | ${DateTime.parse(orderDate).day}.${DateTime.parse(orderDate).month}.${DateTime.parse(orderDate).year}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 14),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      border: Border.all(width: 1, color: AppColors.primaryLight),
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    child: Text(
                      'Bajarilmoqda',
                      style: AppTextStyles.semiBoldStyle.copyWith(color: AppColors.primaryLight, fontSize: 10),
                    ),
                  ),
                ],
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(height: 1),
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                        side: const BorderSide(color: AppColors.error),
                      ),
                    ),
                    padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 6)),
                    minimumSize: const WidgetStatePropertyAll(Size.zero),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Bekor qilish",
                    style: AppTextStyles.semiBoldStyle.copyWith(
                      fontSize: 14,
                      color: AppColors.error,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    fixedSize: const WidgetStatePropertyAll(Size.infinite),
                    backgroundColor: WidgetStatePropertyAll(AppColors.primaryLight),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                        side: BorderSide(color: AppColors.primaryLight),
                      ),
                    ),
                    padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 6)),
                    minimumSize: const WidgetStatePropertyAll(Size.zero),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Kuzatish",
                    style: AppTextStyles.semiBoldStyle.copyWith(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
