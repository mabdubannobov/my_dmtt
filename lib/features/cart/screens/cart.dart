import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_text_styles.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: AppBar(
            backgroundColor: Colors.white,
            leading: SvgPicture.asset(AppAssets.icons.appBarLogo),
            leadingWidth: 28,
            title: const Align(
              alignment: Alignment.centerLeft,
              child: Text('Savat'),
            ),
            titleTextStyle: AppTextStyles.titleStyle,
          ),
        ),
      ],
    );
  }
}
