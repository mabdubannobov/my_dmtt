import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_dmtt/features/home/widgets/empty_cart.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_text_styles.dart';
import '../../../models/product_model.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Box myDataBox;

  @override
  void initState() {
    super.initState();
    myDataBox = Hive.box<ProductModel>('productsBox');
  }

  void _deleteItem(String key) async {
    await myDataBox.delete(key);
    setState(() {});
  }

  // Future<void> _clearHiveBox() async {
  //   await myDataBox.clear();
  //   _getData();
  // }

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
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: myDataBox.listenable(),
            builder: (context, Box box, _) {
              if (box.isEmpty) {
                return const EmptyCart();
              }

              return ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  final key = box.keyAt(index);
                  final item = box.get(key);

                  return CartItem(
                    itemKey: key,
                    name: item.name,
                    count: item.value,
                    measure: item.measure,
                    photoUrl: item.imageUrl,
                    onDelete: () => _deleteItem(key),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
