import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    required this.name,
    required this.count,
    required this.measure,
    required this.photoUrl,
    super.key,
  });

  final String name;
  final double count;
  final String measure;
  final String photoUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      height: 80,
      child: Row(
        children: [
          CachedNetworkImage(
            height: 80,
            width: 80,
            imageUrl: photoUrl,
            placeholder: (context, url) => const CupertinoActivityIndicator(),
          ),
          const SizedBox(width: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: AppTextStyles.boldStyle.copyWith(
                    fontSize: 18,
                  ),
                ),
                Text(
                  "$count $measure",
                  style: AppTextStyles.boldStyle.copyWith(
                    fontSize: 18,
                    color: AppColors.primaryLight,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(AppAssets.icons.delete),
                SvgPicture.asset(AppAssets.icons.edit),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
