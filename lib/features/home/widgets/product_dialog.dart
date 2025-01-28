import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../../models/product_model.dart';

class ProductDialog extends StatelessWidget {
  const ProductDialog({
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
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();

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
                imageUrl: productImage,
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
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                fillColor: Theme.of(context).primaryColorDark,
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
                if (double.parse(textController.text) > productQuantity) {
                } else {
                  await storeData(
                    productTitle,
                    double.parse(textController.text),
                    companyId,
                    productMeasure,
                    productImage,
                  );
                }
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
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
