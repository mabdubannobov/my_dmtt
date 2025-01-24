import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_dmtt/constants/app_colors.dart';
import 'package:my_dmtt/features/account/bloc/account_bloc.dart';
import 'package:my_dmtt/features/account/screens/notifications.dart';
import 'package:my_dmtt/features/account/screens/user_data.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_text_styles.dart';
import '../../../models/user_model.dart';
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
      listener: (context, state) {},
      builder: (context, state) {
        if (state is AccountLoadingState) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }

        UserModel userModel = UserModel(
          firstName: "?",
          lastName: 'Aniqlanmadi',
          district: 'Aniqlanmadi',
          phoneNumber: "+998000000000",
        );

        if (state is AccountLoadedState) {
          userModel = state.userModel;
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: AppBar(
                backgroundColor: Colors.white,
                leading: SvgPicture.asset(AppAssets.icons.appBarLogo),
                leadingWidth: 28,
                title: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Hisob'),
                ),
                titleTextStyle: AppTextStyles.titleStyle,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserDataScreen(userData: userModel),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        width: 80,
                        height: 80,
                        imageUrl: userModel.imageUrl ??
                            "https://ik.imagekit.io/rjt7sz5ns/noPhoto.png?updatedAt=1714584632953",
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${userModel.firstName} ${userModel.lastName}",
                          style: AppTextStyles.boldStyle.copyWith(fontSize: 20, color: AppColors.greyscaleLight),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "${userModel.phoneNumber!.substring(0, 4)} (${userModel.phoneNumber!.substring(4, 6)}) ${userModel.phoneNumber!.substring(6, 9)}-${userModel.phoneNumber!.substring(9, 11)}-${userModel.phoneNumber!.substring(11, 13)}",
                          style: AppTextStyles.mediumStyle
                              .copyWith(fontSize: 16, color: AppColors.greyscaleLight.shade800),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(height: 80, child: SvgPicture.asset(AppAssets.icons.edit)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Divider(
                color: AppColors.greyscaleLight.shade200,
              ),
            ),
            SettingsItem(
              leadingIcon: AppAssets.icons.calendar,
              title: '"Aqlvoy" taomnomasi',
              onTap: () {},
            ),
            SettingsItem(
              leadingIcon: AppAssets.icons.folder,
              title: 'Sifat sertifikatlari',
              onTap: () {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Divider(
                color: AppColors.greyscaleLight.shade200,
              ),
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
              leadingIcon: AppAssets.icons.language,
              title: 'Ilova tili',
              onTap: () {},
            ),
            SettingsItem(
              leadingIcon: AppAssets.icons.show,
              title: 'Tungi rejim',
              trailingIcon: Switch(
                value: false,
                onChanged: (value) {},
                activeColor: Colors.white,
                activeTrackColor: AppColors.primaryLight.shade500,
                inactiveTrackColor: AppColors.greyscaleLight.shade300,
                trackOutlineWidth: const WidgetStatePropertyAll(0),
                trackOutlineColor: WidgetStatePropertyAll(AppColors.greyscaleLight.shade300),
                inactiveThumbColor: Colors.white,
              ),
              onTap: () {},
            ),
            SettingsItem(
              leadingIcon: AppAssets.icons.logout,
              title: 'Chiqish',
              trailingIcon: const SizedBox.shrink(),
              onTap: () {},
            )
          ],
        );
      },
    );
  }
}
