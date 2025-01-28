import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class UserDataField extends StatefulWidget {
  const UserDataField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<UserDataField> createState() => _UserDataFieldState();
}

class _UserDataFieldState extends State<UserDataField> {
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
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: TextField(
        controller: widget.controller,
        focusNode: _focusNode,
        style: Theme.of(context).textTheme.displaySmall,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          filled: true,
          fillColor: _isFocused ? Theme.of(context).focusColor : Theme.of(context).primaryColorDark,
          suffixIconConstraints: const BoxConstraints(maxHeight: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(width: 1, color: AppColors.primaryLight),
          ),
        ),
      ),
    );
  }
}
