import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_dmtt/constants/app_colors.dart';
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
  late Box<ProductModel> cartDataBox;

  @override
  void initState() {
    super.initState();
    cartDataBox = Hive.box<ProductModel>('productsBox');
  }

  String formatNumber(double value) {
    if (value % 1 == 0) {
      return value.toInt().toString();
    } else {
      return value.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mahsulotlar"),
        leading: Padding(
          padding: EdgeInsets.only(left: 24),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              AppAssets.icons.arrowLeft,
              colorFilter: ColorFilter.mode(
                Theme.of(context).primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: cartDataBox.listenable(),
        builder: (context, Box<ProductModel> box, _) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            itemCount: widget.allProducts.length,
            itemBuilder: (context, index) {
              ProductModel currentItem = widget.allProducts[index];
              List<ProductModel> cartElements = cartDataBox.values.toList();
              double cartData = 0;
              String cartMeasure = "";

              for (var element in cartElements) {
                if (element.name == currentItem.name) {
                  cartData = element.value!;
                  cartMeasure = element.measure;
                }
              }

              return InkWell(
                onTap: () => showDialog(
                  context: context,
                  builder: (context) {
                    return ProductDialog(
                      productImage: currentItem.imageUrl ??
                          "https://ik.imagekit.io/rjt7sz5ns/noPhoto.png?updatedAt=1714584632953",
                      productTitle: currentItem.name,
                      productQuantity: safeParseDouble(currentItem.count),
                      productMeasure: currentItem.measure,
                      companyId: 2,
                      productID: 2,
                    );
                  },
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(14),
                  height: 148,
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
                      Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: currentItem.imageUrl ??
                                "https://ik.imagekit.io/rjt7sz5ns/noPhoto.png?updatedAt=1714584632953",
                            width: 120,
                            height: 120,
                          ),
                          cartData != 0
                              ? Padding(
                                  padding: EdgeInsets.only(left: 12, top: 12),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryLight,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 6),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          AppAssets.icons.bagActive,
                                          colorFilter: ColorFilter.mode(
                                              Colors.white, BlendMode.srcIn),
                                          width: 12,
                                          height: 12,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          '${formatNumber(cartData)} $cartMeasure',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              currentItem.name,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                SvgPicture.asset(AppAssets.icons.delivey),
                                SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    "Supply Foods MCHJ",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
