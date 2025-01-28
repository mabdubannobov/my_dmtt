import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'product_dialog.dart';

class ProductHomeContainer extends StatefulWidget {
  const ProductHomeContainer({
    super.key,
    required this.productImage,
    required this.productTitle,
    required this.productQuantity,
    required this.productMeasure,
    required this.companyId,
  });

  final String productImage;
  final String productTitle;
  final double productQuantity;
  final String productMeasure;
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
          );
        },
      ),
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 24,
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
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
            ),
            const SizedBox(height: 12),
            Text(
              widget.productTitle,
              style: Theme.of(context).textTheme.headlineSmall,
              softWrap: false,
            ),
            const SizedBox(height: 14),
            Text(
              "Qoldiq - ${formatNumber(widget.productQuantity)} ${widget.productMeasure}",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 14),
          ],
        ),
      ),
    );
  }
}
