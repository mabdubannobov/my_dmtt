import 'package:flutter/material.dart';

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget widget;

  PersistentHeader({required this.widget});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      width: double.infinity,
      height: 80.0,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.symmetric(vertical: 12),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Center(child: widget),
      ),
    );
  }

  @override
  double get maxExtent => 80.0;

  @override
  double get minExtent => 80.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
