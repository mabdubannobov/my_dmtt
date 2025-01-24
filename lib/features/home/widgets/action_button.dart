import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_dmtt/constants/sharedprefrences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/app_colors.dart';
import '../../signin/screens/sign_in.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.icon,
  });

  final String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove(Shared.accessToken);
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const SignInScreen(),
            ),
            (Route route) => false);
      },
      child: Container(
        width: 48,
        height: 48,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.greyscaleLight.shade200,
            width: 1,
          ),
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
