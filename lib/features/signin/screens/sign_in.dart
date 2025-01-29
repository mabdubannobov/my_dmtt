import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_dmtt/features/main_screen.dart';
import 'package:my_dmtt/features/signin/bloc/sign_in_bloc.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../widgets/sign_in_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocConsumer<SignInBloc, SignInState>(
          listener: (context, state) {
            if (state is SignInLoadedState) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const MainScreen(),
                  ),
                  (Route route) => false);
            } else if (state is SignInErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: AppColors.error.withValues(alpha: 0.2),
                  elevation: 0,
                  content: Text(
                    'Login yoki parol xato kiritildi',
                    style: AppTextStyles.regularStyle.copyWith(
                      fontSize: 16,
                      color: AppColors.error,
                    ),
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is SignInLoadingState) {
              return Center(
                child: CupertinoActivityIndicator(color: Theme.of(context).primaryColor),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 48),
                SvgPicture.asset(
                  AppAssets.icons.appBarLogo,
                  width: 120,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 48),
                  child: Text(
                    "Hisobga kirish",
                    style: AppTextStyles.boldStyle.copyWith(
                      fontSize: 32,
                      height: 1.2,
                      color: AppColors.greyscaleLight,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SignInField(
                    controller: userController,
                    icon: AppAssets.icons.userField,
                    hintText: 'Foydalanuvchi nomi',
                    activeIcon: AppAssets.icons.userFieldActive,
                    filledIcon: AppAssets.icons.userFieldFilled,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                  child: SignInField(
                    controller: passwordController,
                    icon: AppAssets.icons.passwordField,
                    hintText: 'Xavfsizlik paroli',
                    activeIcon: AppAssets.icons.passwordFieldActive,
                    filledIcon: AppAssets.icons.passwordFieldFilled,
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    fixedSize: WidgetStatePropertyAll(Size.fromWidth(MediaQuery.of(context).size.width - 48)),
                    backgroundColor: const WidgetStatePropertyAll(AppColors.disabledButton),
                  ),
                  onPressed: () {
                    if (userController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                      context.read<SignInBloc>().add(
                            SignInEnterEvent(
                              userController.text,
                              passwordController.text,
                            ),
                          );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      "Kirish",
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
            );
          },
        ),
      ),
    );
  }
}
