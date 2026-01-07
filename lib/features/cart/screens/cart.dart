import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:bolajon_taminoti/features/cart/bloc/cart_bloc.dart';
import 'package:bolajon_taminoti/features/cart/widgets/succees_order.dart';
import 'package:bolajon_taminoti/features/cart/widgets/empty_cart.dart';

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
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    myDataBox = Hive.box<ProductModel>('productsBox');
  }

  void _deleteItem(int key) async {
    await myDataBox.deleteAt(key);
    setState(() {});
  }

  Future<void> _onOrderButtonPressed(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      locale: const Locale('uz', 'UZ'),
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryLight,
              onPrimary: Colors.white,
              onSurface: Theme.of(context).primaryColor,
            ),
            datePickerTheme: DatePickerThemeData(
              headerBackgroundColor: AppColors.primaryLight,
              headerForegroundColor: Colors.white,
              backgroundColor: Theme.of(context).primaryColorDark,
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null) {
      // ignore: use_build_context_synchronously
      context.read<CartBloc>().add(
        CreateOrderEvent(
          products: myDataBox.values.toList(),
          date: selectedDate,
        ),
      );
      await myDataBox.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Savat'),
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
      body: Column(
        children: [
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
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.symmetric(horizontal: 24),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(
                                    0XFF04060F,
                                  ).withValues(alpha: 0.05),
                                  blurRadius: 60,
                                  spreadRadius: 0,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: box.length,
                              itemBuilder: (context, index) {
                                final item = box.getAt(
                                  index,
                                ); // Index bo‘yicha mahsulotni olamiz

                                return Column(
                                  children: [
                                    CartItem(
                                      itemKey:
                                          index, // Endi indeks asosida ishlaydi
                                      name: item.name,
                                      count: item.value,
                                      measure: item.measure,
                                      photoUrl: item.imageUrl,
                                      onDelete:
                                          () => _deleteItem(
                                            index,
                                          ), // Index orqali o‘chiramiz
                                    ),
                                    if (index != box.length - 1)
                                      const Divider(),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 28),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 24,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            border: Border(
                              top: BorderSide(
                                color: Theme.of(context).dividerColor,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primaryLight.withValues(
                                    alpha: 0.25,
                                  ),
                                  spreadRadius: 0,
                                  blurRadius: 24,
                                  offset: const Offset(4, 8),
                                ),
                              ],
                            ),
                            child: TextButton(
                              style: ButtonStyle(
                                fixedSize: WidgetStatePropertyAll(
                                  Size.fromWidth(
                                    MediaQuery.of(context).size.width - 32,
                                  ),
                                ),
                                backgroundColor: WidgetStatePropertyAll(
                                  AppColors.primaryLight,
                                ),
                              ),
                              onPressed: () {
                                _onOrderButtonPressed(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                child: Text(
                                  'Buyurtma berish',
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
          ),
        ],
      ),
    );
  }
}
