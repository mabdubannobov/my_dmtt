import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    required this.leadingIcon,
    required this.title,
    required this.onTap,
    this.trailingIcon,
    super.key,
  });

  final String leadingIcon;
  final String title;
  final Function() onTap;
  final Widget? trailingIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      onTap: onTap,
      leading: SvgPicture.asset(
        leadingIcon,
        width: 28,
        height: 28,
      ),
      title: Row(
        children: [
          Text(
            title,
            style: AppTextStyles.semiBoldStyle.copyWith(
              fontSize: 18,
              color: title == 'Chiqish' ? AppColors.error : AppColors.greyscaleLight.shade900,
            ),
          ),
          const Spacer(),
          Text(
            title == "Ilova tili" ? "O'zbek" : "",
            style: AppTextStyles.semiBoldStyle.copyWith(
              fontSize: 18,
              color: AppColors.greyscaleLight.shade900,
            ),
          ),
        ],
      ),
      trailing: trailingIcon ?? SvgPicture.asset(AppAssets.icons.arrowRight),
    );
  }
}
