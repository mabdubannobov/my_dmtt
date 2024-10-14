import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_dmtt/features/orders/widgets/active_order.dart';
import 'package:my_dmtt/features/orders/widgets/completed_order.dart';
import 'package:my_dmtt/features/orders/widgets/rejected_order.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
              child: Text('Buyurtmalar'),
            ),
            titleTextStyle: AppTextStyles.titleStyle,
            actions: [
              TextButton(
                style: ButtonStyle(
                  fixedSize: const WidgetStatePropertyAll(Size.infinite),
                  backgroundColor: WidgetStatePropertyAll(AppColors.primaryLight),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                      side: BorderSide(color: AppColors.primaryLight),
                    ),
                  ),
                  padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 6, horizontal: 10)),
                  minimumSize: const WidgetStatePropertyAll(Size.zero),
                ),
                onPressed: () {},
                child: Text(
                  "2024, Oktabr",
                  style: AppTextStyles.semiBoldStyle.copyWith(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            color: Colors.transparent,
            child: TabBar(
              dividerHeight: 1,
              indicatorWeight: 4,
              controller: _tabController,
              labelColor: AppColors.primaryLight,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: AppColors.primaryLight,
              dividerColor: AppColors.greyscaleLight.shade200,
              unselectedLabelColor: AppColors.greyscaleLight.shade500,
              labelStyle: AppTextStyles.semiBoldStyle.copyWith(fontSize: 16),
              overlayColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
                return states.contains(WidgetState.focused) ? null : Colors.transparent;
              }),
              tabs: const [
                Tab(text: 'Faol'),
                Tab(text: 'Bajarilgan'),
                Tab(text: 'Rad etilgan'),
              ],
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              Center(
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                  itemCount: 1,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 24);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return const ActiveOrder(
                      idOrder: 140,
                      itemsCount: 1,
                      orderDate: "15.10.2024",
                    );
                  },
                ),
              ),
              Center(
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                  itemCount: 3,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 24);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return const CompletedOrder(
                      idOrder: 134,
                      itemsCount: 8,
                      orderDate: "14.10.2024",
                    );
                  },
                ),
              ),
              Center(
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                  itemCount: 3,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 24);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return const RejectedOrder(
                      idOrder: 133,
                      itemsCount: 4,
                      orderDate: '10.10.2024',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
