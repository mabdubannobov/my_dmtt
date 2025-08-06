import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_dmtt/constants/app_colors.dart';
import '../../../constants/app_assets.dart';
import '../../../constants/app_text_styles.dart';
import '../../../models/order_model.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({
    required this.currentOrder,
    super.key,
  });

  final OrderModel currentOrder;

  @override
  Widget build(BuildContext context) {
    final List<Item> items = currentOrder.items;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Buyurtma - #${currentOrder.id}"),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            highlightColor: Colors.transparent,
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset(
              AppAssets.icons.arrowLeft,
              colorFilter: ColorFilter.mode(
                Theme.of(context).primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 28),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: const BorderRadius.all(Radius.circular(28)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF04060F).withValues(alpha: 0.05),
                    blurRadius: 60,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Yetkazib beruvchi",
                    style: AppTextStyles.boldStyle.copyWith(
                      fontSize: 20,
                      color: AppColors.greyscaleLight.shade900,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Divider(
                      color: AppColors.greyscaleLight.shade200,
                    ),
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          width: 52,
                          height: 52,
                          AppAssets.images.userImage,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Supply Foods MCHJ",
                            style: AppTextStyles.boldStyle.copyWith(
                              fontSize: 18,
                              color: AppColors.greyscaleLight.shade900,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "Muhammadqodir - +998 (90) 369-80-08",
                            style: AppTextStyles.mediumStyle.copyWith(
                              fontSize: 14,
                              color: AppColors.greyscaleLight.shade700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: const BorderRadius.all(Radius.circular(28)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF04060F).withValues(alpha: 0.05),
                    blurRadius: 60,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mahsulotlar",
                    style: AppTextStyles.boldStyle.copyWith(
                      fontSize: 20,
                      color: AppColors.greyscaleLight.shade900,
                    ),
                  ),
                  ...List.generate(items.length, (index) {
                    final item = items[index];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Divider(
                            color: AppColors.greyscaleLight.shade200,
                          ),
                        ),
                        Row(
                          children: [
                            CachedNetworkImage(
                              height: 80,
                              width: 80,
                              imageUrl: item.productImage,
                              placeholder: (context, url) => Padding(
                                padding: EdgeInsets.all(20),
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.productName,
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  "${item.count} ${item.measure}",
                                  style: AppTextStyles.boldStyle.copyWith(
                                    fontSize: 18,
                                    color: AppColors.primaryLight,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
