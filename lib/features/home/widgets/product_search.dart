import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';

class ProductSearch extends StatelessWidget {
  const ProductSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        fillColor: AppColors.greyscaleLight.shade100,
        filled: true,
        prefixIconConstraints: const BoxConstraints(maxHeight: 20),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 20, right: 12),
          child: SvgPicture.asset(
            AppAssets.icons.search,
          ),
        ),
        hintText: 'Qaysi mahsulotni qidiramiz?',
        hintStyle: AppTextStyles.regularStyle.copyWith(
          color: AppColors.greyscaleLight.shade400,
          letterSpacing: 0.2,
          height: 1.4,
          fontSize: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
