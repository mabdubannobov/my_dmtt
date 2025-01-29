import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_dmtt/constants/app_assets.dart';

import '../../../constants/app_colors.dart';

class SignInField extends StatefulWidget {
  const SignInField({
    super.key,
    required this.controller,
    required this.icon,
    required this.hintText,
    required this.activeIcon,
    required this.filledIcon,
  });

  final TextEditingController controller;
  final String hintText;
  final String icon;
  final String activeIcon;
  final String filledIcon;

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
    bool isObscure = true;
    return TextField(
      controller: widget.controller,
      focusNode: _focusNode,
      obscureText: widget.hintText == "Xavfsizlik paroli" ? isObscure : false,
      obscuringCharacter: "*",
      style: Theme.of(context).textTheme.displaySmall,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 20),
        filled: true,
        fillColor: _isFocused ? Theme.of(context).focusColor : Theme.of(context).primaryColorDark,
        prefixIconConstraints: const BoxConstraints(maxHeight: 20),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 20, right: 12),
          child: SvgPicture.asset(
            _isFocused
                ? widget.activeIcon
                : widget.controller.text == ""
                    ? widget.icon
                    : widget.filledIcon,
          ),
        ),
        suffixIconConstraints: const BoxConstraints(maxHeight: 20),
        suffixIcon: widget.hintText == "Xavfsizlik paroli"
            ? InkWell(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: SvgPicture.asset(_isFocused ? AppAssets.icons.hideActive : AppAssets.icons.hide),
                ),
              )
            : const SizedBox(),
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.labelSmall,
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
