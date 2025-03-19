import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:my_dmtt/constants/app_assets.dart';

import 'product_dialog.dart';

class ProductHomeContainer extends StatefulWidget {
  const ProductHomeContainer({
    super.key,
    required this.productImage,
    required this.productTitle,
    required this.productQuantity,
    required this.productMeasure,
    required this.productPrice,
    required this.companyName,
    required this.companyId,
  });

  final String productImage;
  final String productTitle;
  final double productQuantity;
  final String productMeasure;
  final int productPrice;
  final String companyName;
  final int companyId;

  @override
  State<ProductHomeContainer> createState() => _ProductHomeContainerState();
}

class _ProductHomeContainerState extends State<ProductHomeContainer> {
  String formatNumber(double value) {
    if (value % 1 == 0) {
      return value.toInt().toString();
    } else {
      return value.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (context) {
          return ProductDialog(
            productImage: widget.productImage,
            productTitle: widget.productTitle,
            productQuantity: widget.productQuantity,
            productMeasure: widget.productMeasure,
            companyId: widget.companyId,
            productID: 2,
          );
        },
      ),
      child: Container(
        width: 220,
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: Theme.of(context).primaryColorLight,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF04060F).withValues(alpha: 0.05),
              spreadRadius: 0,
              blurRadius: 60,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: widget.productImage,
              width: 192,
              height: 192,
            ),
            const SizedBox(height: 14),
            Text(
              widget.productTitle,
              style: Theme.of(context).textTheme.headlineSmall,
              softWrap: false,
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                SvgPicture.asset(AppAssets.icons.chart),
                SizedBox(width: 6),
                Text(
                  "${formatNumber(widget.productQuantity)} ${widget.productMeasure}",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(width: 6),
                Text(
                  "|",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(width: 6),
                SvgPicture.asset(AppAssets.icons.goldWallet),
                SizedBox(width: 6),
                Text(
                  "${NumberFormat("#,###", "en_US").format(widget.productPrice).replaceAll(",", " ")} so'm",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                SvgPicture.asset(AppAssets.icons.delivey),
                SizedBox(width: 6),
                Expanded(
                  child: Text(
                    widget.companyName,
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
