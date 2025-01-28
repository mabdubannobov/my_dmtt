import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_dmtt/features/home/screens/home.dart';
import 'package:my_dmtt/features/home/widgets/product_dialog.dart';
import 'package:my_dmtt/models/product_model.dart';

import '../../../constants/app_assets.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({required this.allProducts, super.key});
  final List<ProductModel> allProducts;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mahsulotlar"),
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
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        itemCount: widget.allProducts.length,
        itemBuilder: (context, index) {
          ProductModel currentItem = widget.allProducts[index];
          return InkWell(
            onTap: () => showDialog(
              context: context,
              builder: (context) {
                return ProductDialog(
                  productImage: currentItem.imageUrl!,
                  productTitle: currentItem.name,
                  productQuantity: safeParseDouble(currentItem.count),
                  productMeasure: currentItem.measure,
                  companyId: 2,
                );
              },
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(14),
              height: 124,
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
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        currentItem.imageUrl ?? "https://ik.imagekit.io/rjt7sz5ns/noPhoto.png?updatedAt=1714584632953",
                    width: 96,
                    height: 96,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        currentItem.name,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        "Qoldiq - ${currentItem.count} ${currentItem.measure}",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(AppAssets.icons.wallet),
                          const SizedBox(width: 6),
                          Text(
                            "1 500 so'm",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
