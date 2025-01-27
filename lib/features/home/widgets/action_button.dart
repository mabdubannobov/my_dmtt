import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.icon,
  });

  final String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 48,
        height: 48,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Theme.of(context).dividerColor,
            width: 1,
          ),
        ),
        child: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(
            Theme.of(context).primaryColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
