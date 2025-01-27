import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../../models/product_model.dart';

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
  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();

    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            backgroundColor: Theme.of(context).dialogBackgroundColor,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(58, 8, 58, 32),
                    child: CachedNetworkImage(
                      imageUrl: widget.productImage,
                    ),
                  ),
                  Text(
                    'Miqdorni kiriting',
                    style: AppTextStyles.boldStyle.copyWith(
                      fontSize: 24,
                      color: AppColors.primaryLight,
                    ),
                  ),
                  const SizedBox(height: 32),
                  TextField(
                    controller: textController,
                    style: AppTextStyles.boldStyle.copyWith(
                      fontSize: 24,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      // contentPadding: const EdgeInsets.symmetric(vertical: 5),
                      fillColor: AppColors.greyscaleLight.shade50,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: AppColors.primaryLight,
                          width: 2,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: AppColors.primaryLight,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: AppColors.primaryLight,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(AppColors.disabledButton),
                      padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                    onPressed: () async {
                      if (double.parse(textController.text) > widget.productQuantity) {
                      } else {
                        await storeData(
                          widget.productTitle,
                          double.parse(textController.text),
                          widget.companyId,
                          widget.productMeasure,
                          widget.productImage,
                        );
                      }
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    child: Text(
                      "Savatga qo'shish",
                      style: AppTextStyles.boldStyle.copyWith(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
              "Qoldiq - ${widget.productQuantity} ${widget.productMeasure}",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 14),
          ],
        ),
      ),
    );
  }
}

Future<void> storeData(
  String name,
  double count,
  int companyId,
  String measure,
  String imageUrl,
) async {
  final myDataBox = Hive.box<ProductModel>('productsBox');

  await myDataBox.put(
    name,
    ProductModel(
      name: name,
      value: count,
      companyId: companyId,
      measure: measure,
      imageUrl: imageUrl,
    ),
  );
}
