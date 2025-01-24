import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_dmtt/constants/app_colors.dart';
import 'package:my_dmtt/features/account/bloc/account_bloc.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_text_styles.dart';
import '../../../models/user_model.dart';

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
                        "+998 (91) 650-66-26",
                        style:
                            AppTextStyles.mediumStyle.copyWith(fontSize: 16, color: AppColors.greyscaleLight.shade800),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SvgPicture.asset(AppAssets.icons.edit),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Divider(
                color: AppColors.greyscaleLight.shade200,
              ),
            ),
            const ListTile()
          ],
        );
      },
    );
  }
}
