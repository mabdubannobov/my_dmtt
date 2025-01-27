import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_dmtt/constants/app_assets.dart';
import 'package:my_dmtt/constants/app_colors.dart';
import 'package:my_dmtt/constants/app_text_styles.dart';

class SettingsNotifications extends StatefulWidget {
  const SettingsNotifications({super.key});

  @override
  State<SettingsNotifications> createState() => _SettingsNotificationsState();
}

class _SettingsNotificationsState extends State<SettingsNotifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bildirishnomalar"),
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            highlightColor: Colors.transparent,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(AppAssets.icons.arrowLeft),
          ),
        ),
        titleTextStyle: AppTextStyles.boldStyle.copyWith(
          color: AppColors.greyscaleLight,
          fontSize: 24,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Asosiy bildirishnomalar",
                    style: AppTextStyles.semiBoldStyle.copyWith(
                      fontSize: 18,
                      color: AppColors.greyscaleLight,
                    ),
                  ),
                  const Spacer(),
                  Switch(
                    value: true,
                    onChanged: (value) {},
                    activeColor: Colors.white,
                    activeTrackColor: AppColors.primaryLight.shade500,
                  )
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Text(
                    "Ovoz",
                    style: AppTextStyles.semiBoldStyle.copyWith(
                      fontSize: 18,
                      color: AppColors.greyscaleLight,
                    ),
                  ),
                  const Spacer(),
                  Switch(
                    value: true,
                    onChanged: (value) {},
                    activeColor: Colors.white,
                    activeTrackColor: AppColors.primaryLight.shade500,
                  )
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Text(
                    "Tebranish",
                    style: AppTextStyles.semiBoldStyle.copyWith(
                      fontSize: 18,
                      color: AppColors.greyscaleLight,
                    ),
                  ),
                  const Spacer(),
                  Switch(
                    value: true,
                    onChanged: (value) {},
                    activeColor: Colors.white,
                    activeTrackColor: AppColors.primaryLight.shade500,
                  )
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Text(
                    "Yangiliklar",
                    style: AppTextStyles.semiBoldStyle.copyWith(
                      fontSize: 18,
                      color: AppColors.greyscaleLight,
                    ),
                  ),
                  const Spacer(),
                  Switch(
                    value: true,
                    onChanged: (value) {},
                    activeColor: Colors.white,
                    activeTrackColor: AppColors.primaryLight.shade500,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
