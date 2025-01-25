import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_dmtt/features/cart/bloc/cart_bloc.dart';
import 'package:my_dmtt/features/cart/widgets/succees_order.dart';
import 'package:my_dmtt/features/home/widgets/empty_cart.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../../models/product_model.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Box<ProductModel> myDataBox;

  @override
  void initState() {
    super.initState();
    myDataBox = Hive.box<ProductModel>('productsBox');
  }

  void _deleteItem(String key) async {
    await myDataBox.delete(key);
    setState(() {});
  }

  Future<void> _clearHiveBox() async {
    await myDataBox.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: AppBar(
            backgroundColor: Colors.white,
            leading: SvgPicture.asset(AppAssets.icons.appBarLogo),
            leadingWidth: 28,
            title: const Align(
              alignment: Alignment.centerLeft,
              child: Text('Savat'),
            ),
            titleTextStyle: AppTextStyles.titleStyle,
          ),
        ),
        BlocConsumer<CartBloc, CartState>(
          builder: (context, state) {
            return Expanded(
              child: ValueListenableBuilder(
                valueListenable: myDataBox.listenable(),
                builder: (context, Box box, _) {
                  if (box.isEmpty) {
                    return const EmptyCart();
                  }

                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: box.length,
                          itemBuilder: (context, index) {
                            final key = box.keyAt(index);
                            final item = box.get(key);

                            return Column(
                              children: [
                                CartItem(
                                  itemKey: key,
                                  name: item.name,
                                  count: item.value,
                                  measure: item.measure,
                                  photoUrl: item.imageUrl,
                                  onDelete: () => _deleteItem(key),
                                ),
                                if (index != box.length - 1)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: Divider(
                                      color: AppColors.greyscaleLight.shade100,
                                      thickness: 1.0,
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              top: BorderSide(
                                color: AppColors.greyscaleLight.shade100,
                                width: 1.0,
                              ),
                            )),
                        child: TextButton(
                          style: ButtonStyle(
                            fixedSize: WidgetStatePropertyAll(Size.fromWidth(MediaQuery.of(context).size.width - 32)),
                            backgroundColor: WidgetStatePropertyAll(AppColors.primaryLight),
                          ),
                          onPressed: () {
                            context.read<CartBloc>().add(CreateOrderEvent(products: myDataBox.values.toList()));
                            _clearHiveBox();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              "Buyurtma berish",
                              style: AppTextStyles.boldStyle.copyWith(
                                color: Colors.white,
                                fontSize: 16,
                                letterSpacing: 0.2,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          },
          listener: (context, state) {
            if (state is CreatedOrderState) {
              showDialog(
                context: context,
                builder: (_) => const SuccessOrderDialog(),
              );
            }
          },
        )
      ],
    );
  }
}
