import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bolajon_taminoti/constants/app_colors.dart';
import 'package:bolajon_taminoti/cubit/theme_cubit.dart';
import 'package:bolajon_taminoti/features/account/bloc/account_bloc.dart';
import 'package:bolajon_taminoti/features/account/screens/notifications.dart';
import 'package:bolajon_taminoti/features/account/screens/user_data.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_text_styles.dart';
import '../../../models/user_model.dart';
import '../widgets/exit_bottom_sheet.dart';
import '../widgets/settings_item.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AccountBloc>().add(GetUserDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountBloc, AccountState>(
      listener: (context, state) {
        if (state is AccountUpdatedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Ma'lumotlaringiz muvaffaqiyatli yangilandi!",
                style: AppTextStyles.semiBoldStyle.copyWith(
                  color: Colors.white,
                ),
              ),
              backgroundColor: AppColors.primaryLight,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is AccountLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        UserModel userModel = UserModel(
          firstName: '?',
          lastName: 'Aniqlanmadi',
          district: 'Aniqlanmadi',
          phoneNumber: '+998000000000',
        );

        if (state is AccountLoadedState) {
          userModel = state.userModel;
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: AppBar(
                leading: SvgPicture.asset(AppAssets.icons.appBarLogo),
                leadingWidth: 28,
                title: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Hisob'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                      width: 80,
                      height: 80,
                      imageUrl:
                          userModel.imageUrl ??
                          'https://ik.imagekit.io/rjt7sz5ns/noPhoto.png?updatedAt=1714584632953',
                      placeholder:
                          (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                      errorWidget:
                          (context, url, error) => const Icon(
                            Icons.person,
                            size: 80,
                            color: Colors.grey,
                          ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${userModel.firstName} ${userModel.lastName}',
                          style: Theme.of(context).textTheme.headlineSmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          '${userModel.phoneNumber!.substring(0, 4)} (${userModel.phoneNumber!.substring(4, 6)}) ${userModel.phoneNumber!.substring(6, 9)}-${userModel.phoneNumber!.substring(9, 11)}-${userModel.phoneNumber!.substring(11, 13)}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      highlightColor: Colors.transparent,
                      onPressed: () async {
                        final updatedUser = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    UserDataScreen(userData: userModel),
                          ),
                        );

                        if (updatedUser != null) {
                          setState(() {
                            userModel = updatedUser;
                          });
                        }
                      },
                      icon: SvgPicture.asset(
                        AppAssets.icons.edit,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(),
            ),
            SettingsItem(
              leadingIcon: AppAssets.icons.folder,
              title: 'Sifat sertifikatlari',
              onTap: () {},
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(),
            ),
            SettingsItem(
              leadingIcon: AppAssets.icons.notification,
              title: 'Bildirishnomalar',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsNotifications(),
                  ),
                );
              },
            ),
            SettingsItem(
              leadingIcon: AppAssets.icons.security,
              title: 'Xavfsizlik',
              onTap: () {},
            ),
            SettingsItem(
              leadingIcon: AppAssets.icons.language,
              title: 'Ilova tili',
              onTap: () {},
            ),
            SettingsItem(
              leadingIcon: AppAssets.icons.show,
              title: 'Tungi rejim',
              trailingIcon: BlocBuilder<ThemeCubit, ThemeMode>(
                builder: (context, themeMode) {
                  return Switch(
                    value: themeMode == ThemeMode.dark,
                    onChanged: (value) {
                      context.read<ThemeCubit>().toggleTheme(value);
                    },
                    activeThumbColor: Colors.white,
                    activeTrackColor: AppColors.primaryLight.shade500,
                    inactiveTrackColor: AppColors.greyscaleLight.shade300,
                    trackOutlineWidth: const WidgetStatePropertyAll(0),
                    trackOutlineColor: WidgetStatePropertyAll(
                      AppColors.greyscaleLight.shade300,
                    ),
                    inactiveThumbColor: Colors.white,
                  );
                },
              ),
              onTap: () {},
            ),
            SettingsItem(
              leadingIcon: AppAssets.icons.logout,
              title: 'Chiqish',
              trailingIcon: const SizedBox.shrink(),
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: const DialogThemeData().backgroundColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(44),
                    ),
                  ),
                  useSafeArea: true,
                  context: context,
                  builder: (context) {
                    return const ExitBottomSheet();
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}
