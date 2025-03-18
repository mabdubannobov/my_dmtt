import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_dmtt/constants/app_assets.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';

class SuccessOrderDialog extends StatelessWidget {
  const SuccessOrderDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      backgroundColor: const DialogThemeData().backgroundColor,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 32),
              child: SvgPicture.asset(AppAssets.icons.successCreateOrder),
            ),
            Text(
              'Qoyilmaqom',
              style: AppTextStyles.boldStyle.copyWith(
                fontSize: 24,
                color: AppColors.primaryLight,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Sizning _-sonli buyurtmangiz muvvafaqiyatli yuborildi.",
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(AppColors.primaryLight),
                  padding: const WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "OK",
                  style: AppTextStyles.boldStyle.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
