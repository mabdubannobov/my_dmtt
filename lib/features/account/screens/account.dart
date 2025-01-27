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
                style: AppTextStyles.semiBoldStyle.copyWith(color: Colors.white),
              ),
              backgroundColor: AppColors.primaryLight,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                      width: 80,
                      height: 80,
                      imageUrl:
                          userModel.imageUrl ?? "https://ik.imagekit.io/rjt7sz5ns/noPhoto.png?updatedAt=1714584632953",
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => const Icon(
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
                          "${userModel.firstName} ${userModel.lastName}",
                          style: AppTextStyles.boldStyle.copyWith(fontSize: 20, color: AppColors.greyscaleLight),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "${userModel.phoneNumber!.substring(0, 4)} (${userModel.phoneNumber!.substring(4, 6)}) ${userModel.phoneNumber!.substring(6, 9)}-${userModel.phoneNumber!.substring(9, 11)}-${userModel.phoneNumber!.substring(11, 13)}",
                          style: AppTextStyles.mediumStyle
                              .copyWith(fontSize: 16, color: AppColors.greyscaleLight.shade800),
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
                            builder: (context) => UserDataScreen(userData: userModel),
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
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: Colors.white,
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
            )
          ],
        );
      },
    );
  }
}
