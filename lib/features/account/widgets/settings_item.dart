import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/app_assets.dart';

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
        colorFilter: ColorFilter.mode(
          Theme.of(context).primaryColor,
          BlendMode.srcIn,
        ),
      ),
      title: Row(
        children: [
          Text(title, style: Theme.of(context).textTheme.bodyLarge),
          const Spacer(),
          Text(
            title == "Ilova tili" ? "O'zbek" : "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
      trailing: trailingIcon ??
          SvgPicture.asset(
            AppAssets.icons.arrowRight,
            colorFilter: ColorFilter.mode(
              Theme.of(context).primaryColor,
              BlendMode.srcIn,
            ),
          ),
    );
  }
}
