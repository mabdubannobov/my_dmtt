import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_dmtt/features/account/bloc/account_bloc.dart';
import 'package:my_dmtt/features/account/widgets/user_data_field.dart';
import 'package:my_dmtt/models/user_model.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';

class UserDataScreen extends StatefulWidget {
  final UserModel userData;
  const UserDataScreen({required this.userData, super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  late UserModel userData;
  late TextEditingController userName;
  late TextEditingController userSurName;
  late TextEditingController userNumber;

  @override
  void initState() {
    super.initState();
    userData = widget.userData;
    userName = TextEditingController(text: widget.userData.firstName);
    userSurName = TextEditingController(text: widget.userData.lastName);
    userNumber = TextEditingController(text: widget.userData.phoneNumber);
  }

  @override
  void dispose() {
    userName.dispose();
    userSurName.dispose();
    userNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ma'lumotlarim"),
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
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                  width: 100,
                  height: 100,
                  imageUrl: userData.imageUrl ?? "https://ik.imagekit.io/rjt7sz5ns/noPhoto.png?updatedAt=1714584632953",
                ),
              ),
              UserDataField(controller: userName),
              UserDataField(controller: userSurName),
              UserDataField(controller: userNumber),
              const Spacer(),
              TextButton(
                style: ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(Size.fromWidth(MediaQuery.of(context).size.width - 48)),
                  backgroundColor: const WidgetStatePropertyAll(AppColors.disabledButton),
                ),
                onPressed: () {
                  final updatedUser = UserModel(
                    firstName: userName.text,
                    lastName: userSurName.text,
                    phoneNumber: userNumber.text,
                  );

                  context.read<AccountBloc>().add(UpdateUserDataEvent(userData: updatedUser));
                  Navigator.pop(context, updatedUser);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "Yangilash",
                    style: AppTextStyles.boldStyle.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                      letterSpacing: 0.2,
                      height: 1.4,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
