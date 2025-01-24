import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
  late List<ProductModel> data;
  final myDataBox = Hive.box<ProductModel>('productsBox');

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    data = myDataBox.values.toList();
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
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 104),
                child: Divider(color: AppColors.greyscaleLight.shade200),
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return CartItem(
                name: data[index].name,
                count: data[index].value!,
                measure: data[index].measure,
                photoUrl: data[index].imageUrl!,
              );
            },
            itemCount: data.length,
          ),
        ),
      ],
    );
  }
}
