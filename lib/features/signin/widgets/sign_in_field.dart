import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';

class SignInField extends StatefulWidget {
  const SignInField({
    super.key,
    required this.controller,
    required this.icon,
    required this.hintText,
  });

  final TextEditingController controller;
  final String hintText;
  final String icon;

  @override
  State<SignInField> createState() => _SignInFieldState();
}

class _SignInFieldState extends State<SignInField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: _focusNode,
      obscureText: widget.hintText == "Xavfsizlik paroli" ? true : false,
      obscuringCharacter: "*",
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 20),
        filled: true,
        fillColor: _isFocused ? AppColors.primaryLight.withValues(alpha: 0.08) : AppColors.greyscaleLight.shade50,
        prefixIconConstraints: const BoxConstraints(maxHeight: 20),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 20, right: 12),
          child: SvgPicture.asset(widget.icon),
        ),
        hintText: widget.hintText,
        hintStyle: AppTextStyles.regularStyle.copyWith(
          color: AppColors.greyscaleLight.shade400,
          letterSpacing: 0.2,
          height: 1.4,
          fontSize: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(width: 1, color: AppColors.primaryLight),
        ),
      ),
    );
  }
}
