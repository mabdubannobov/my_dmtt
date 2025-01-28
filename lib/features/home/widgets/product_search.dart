import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_assets.dart';

class ProductSearch extends StatelessWidget {
  const ProductSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        fillColor: Theme.of(context).primaryColorDark,
        filled: true,
        prefixIconConstraints: const BoxConstraints(maxHeight: 20),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 20, right: 12),
          child: SvgPicture.asset(
            AppAssets.icons.search,
            colorFilter: ColorFilter.mode(
              Theme.of(context).hintColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        hintText: 'Qaysi mahsulotni qidiramiz?',
        hintStyle: Theme.of(context).textTheme.labelSmall,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
