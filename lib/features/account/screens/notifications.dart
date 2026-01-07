import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bolajon_taminoti/constants/app_assets.dart';
import 'package:bolajon_taminoti/constants/app_colors.dart';

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
        title: const Text('Bildirishnomalar'),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            highlightColor: Colors.transparent,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(
              AppAssets.icons.arrowLeft,
              colorFilter: ColorFilter.mode(
                Theme.of(context).primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ),
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
                    'Asosiy bildirishnomalar',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Spacer(),
                  Switch(
                    value: true,
                    onChanged: (value) {},
                    activeThumbColor: Colors.white,
                    activeTrackColor: AppColors.primaryLight.shade500,
                    inactiveTrackColor: AppColors.greyscaleLight.shade300,
                    trackOutlineWidth: const WidgetStatePropertyAll(0),
                    trackOutlineColor: WidgetStatePropertyAll(
                      AppColors.greyscaleLight.shade300,
                    ),
                    inactiveThumbColor: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Text('Ovoz', style: Theme.of(context).textTheme.bodyLarge),
                  const Spacer(),
                  Switch(
                    value: true,
                    onChanged: (value) {},
                    activeThumbColor: Colors.white,
                    activeTrackColor: AppColors.primaryLight.shade500,
                    inactiveTrackColor: AppColors.greyscaleLight.shade300,
                    trackOutlineWidth: const WidgetStatePropertyAll(0),
                    trackOutlineColor: WidgetStatePropertyAll(
                      AppColors.greyscaleLight.shade300,
                    ),
                    inactiveThumbColor: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Text(
                    'Tebranish',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Spacer(),
                  Switch(
                    value: true,
                    onChanged: (value) {},
                    activeThumbColor: Colors.white,
                    activeTrackColor: AppColors.primaryLight.shade500,
                    inactiveTrackColor: AppColors.greyscaleLight.shade300,
                    trackOutlineWidth: const WidgetStatePropertyAll(0),
                    trackOutlineColor: WidgetStatePropertyAll(
                      AppColors.greyscaleLight.shade300,
                    ),
                    inactiveThumbColor: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Text(
                    'Yangiliklar',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Spacer(),
                  Switch(
                    value: true,
                    onChanged: (value) {},
                    activeThumbColor: Colors.white,
                    activeTrackColor: AppColors.primaryLight.shade500,
                    inactiveTrackColor: AppColors.greyscaleLight.shade300,
                    trackOutlineWidth: const WidgetStatePropertyAll(0),
                    trackOutlineColor: WidgetStatePropertyAll(
                      AppColors.greyscaleLight.shade300,
                    ),
                    inactiveThumbColor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
