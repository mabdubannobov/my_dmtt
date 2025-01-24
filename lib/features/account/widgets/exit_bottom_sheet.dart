import 'package:flutter/material.dart';
import 'package:my_dmtt/constants/app_colors.dart';
import 'package:my_dmtt/constants/app_text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/sharedprefrences.dart';
import '../../signin/screens/sign_in.dart';

class ExitBottomSheet extends StatelessWidget {
  const ExitBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(44),
            topRight: Radius.circular(44),
          ),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Chiqish",
              style: AppTextStyles.boldStyle.copyWith(
                color: AppColors.error,
                fontSize: 24,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Divider(),
            ),
            Text(
              "Ilovani tark etmoqchimisiz?",
              style: AppTextStyles.boldStyle.copyWith(
                fontSize: 20,
                color: AppColors.greyscaleLight,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  style: ButtonStyle(
                    fixedSize: WidgetStatePropertyAll(Size.fromWidth(MediaQuery.of(context).size.width - 38) / 2),
                    backgroundColor: WidgetStatePropertyAll(AppColors.primaryLight.shade100),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      "Yo'q",
                      style: AppTextStyles.boldStyle.copyWith(
                        color: AppColors.primaryLight,
                        fontSize: 16,
                        letterSpacing: 0.2,
                        height: 1.4,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    fixedSize: WidgetStatePropertyAll(Size.fromWidth(MediaQuery.of(context).size.width - 38) / 2),
                    backgroundColor: const WidgetStatePropertyAll(AppColors.error),
                  ),
                  onPressed: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.remove(Shared.accessToken);
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ),
                        (Route route) => false);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      "Ha",
                      style: AppTextStyles.boldStyle.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                        letterSpacing: 0.2,
                        height: 1.4,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
