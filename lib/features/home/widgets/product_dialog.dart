// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../../models/product_model.dart';

class ProductDialog extends StatefulWidget {
  const ProductDialog({
    super.key,
    required this.productImage,
    required this.productTitle,
    required this.productQuantity,
    required this.productMeasure,
    required this.companyId,
    required this.productID,
  });

  final String productImage;
  final String productTitle;
  final double productQuantity;
  final String productMeasure;
  final int companyId;
  final int productID;

  @override
  State<ProductDialog> createState() => _ProductDialogState();
}

class _ProductDialogState extends State<ProductDialog> {
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    _initializeTextController();
  }

  String formatNumber(double value) {
    if (value % 1 == 0) {
      return value.toInt().toString();
    } else {
      return value.toString();
    }
  }

  Future<void> _initializeTextController() async {
    final myDataBox = Hive.box<ProductModel>('productsBox');

    // Mavjud mahsulotni qidiramiz
    ProductModel? existingProduct;
    for (int i = 0; i < myDataBox.length; i++) {
      final product = myDataBox.getAt(i);
      if (product!.name == widget.productTitle) {
        existingProduct = product;
        break;
      }
    }

    // Agar mahsulot bo‘lsa, uning qiymatini chiqaramiz, aks holda bo‘sh qoldiramiz
    textController = TextEditingController(
      text:
          existingProduct != null
              ? formatNumber(existingProduct.value!).toString()
              : '',
    );

    setState(() {}); // UI ni yangilash uchun
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      backgroundColor: const DialogThemeData().backgroundColor,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(58, 8, 58, 32),
              child: CachedNetworkImage(imageUrl: widget.productImage),
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
                backgroundColor: WidgetStatePropertyAll(
                  AppColors.disabledButton,
                ),
                padding: WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
              onPressed: () async {
                final inputText = textController.text;

                if (inputText.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: AppColors.error,
                      content: Text('Siz miqdorni kiritmadingiz!'),
                    ),
                  );
                  return;
                }

                final inputQuantity = double.tryParse(inputText);

                if (inputQuantity == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: AppColors.error,
                      content: Text("To'g'ri miqdorni kiriting!"),
                    ),
                  );
                  return;
                }

                if (inputQuantity >= 0.0) {
                  await storeData(
                    widget.productTitle,
                    inputQuantity,
                    widget.companyId,
                    widget.productMeasure,
                    widget.productImage,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: AppColors.primaryLight,
                      content: const Text("Savatga qo'shildi!"),
                    ),
                  );
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: AppColors.error,
                      content: Text("To'g'ri miqdorni kiriting!"),
                    ),
                  );
                }
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

  // Mahsulot allaqachon mavjudligini tekshiramiz
  int? existingIndex;
  for (int i = 0; i < myDataBox.length; i++) {
    final product = myDataBox.getAt(i);
    if (product!.name == name) {
      existingIndex = i;
      break;
    }
  }

  if (existingIndex != null) {
    await myDataBox.putAt(
      existingIndex,
      ProductModel(
        name: name,
        value: count,
        companyId: companyId,
        measure: measure,
        imageUrl: imageUrl,
      ),
    );
  } else {
    await myDataBox.add(
      ProductModel(
        name: name,
        value: count,
        companyId: companyId,
        measure: measure,
        imageUrl: imageUrl,
      ),
    );
  }
}
