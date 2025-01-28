import 'package:flutter/material.dart';

import '../../../constants/app_assets.dart';

class EmptyOrder extends StatelessWidget {
  const EmptyOrder({
    required this.orderTitle,
    super.key,
  });

  final String orderTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 74),
            child: Image.asset(
              AppAssets.images.emptyOrder,
            ),
          ),
          const SizedBox(height: 40),
          Text(
            "Bo'sh",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Ayni vaqtda sizda $orderTitle buyurtmalar yo'q",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          )
        ],
      ),
    );
  }
}
