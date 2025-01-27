import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_dmtt/features/orders/widgets/active_order.dart';
import 'package:my_dmtt/features/orders/widgets/completed_order.dart';
import 'package:my_dmtt/features/orders/widgets/rejected_order.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../../models/order_model.dart';
import '../bloc/bloc/orders_bloc.dart';
import '../widgets/empty_order.dart';

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
    context.read<OrdersBloc>().add(GetOrdersDataEvent());
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersBloc, OrdersState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is OrdersLoadingState) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }

        List<OrderModel> acceptedOrders = [];
        List<OrderModel> rejectedOrders = [];
        List<OrderModel> activeOrders = [];

        if (state is OrdersLoadedState) {
          acceptedOrders = state.acceptedOrders;
          rejectedOrders = state.rejectedOrders;
          activeOrders = state.pendingOrders + state.progressOrders;
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: AppBar(
                leading: SvgPicture.asset(AppAssets.icons.appBarLogo),
                leadingWidth: 28,
                title: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Buyurtmalar'),
                ),
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
                      "2025, Yanvar",
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
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  activeOrders.isEmpty
                      ? const EmptyOrder(
                          orderTitle: "faol",
                        )
                      : Center(
                          child: ListView.separated(
                            padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                            itemCount: activeOrders.length,
                            separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(height: 24);
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return ActiveOrder(
                                idOrder: activeOrders[index].id,
                                itemsCount: activeOrders[index].items.length,
                                orderDate: activeOrders[index].orderDate,
                              );
                            },
                          ),
                        ),
                  acceptedOrders.isEmpty
                      ? const EmptyOrder(
                          orderTitle: "bajarilgan",
                        )
                      : Center(
                          child: ListView.separated(
                            padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                            itemCount: acceptedOrders.length,
                            separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(height: 24);
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return CompletedOrder(
                                idOrder: acceptedOrders[index].id,
                                itemsCount: acceptedOrders[index].items.length,
                                orderDate: acceptedOrders[index].orderDate,
                              );
                            },
                          ),
                        ),
                  rejectedOrders.isEmpty
                      ? const EmptyOrder(
                          orderTitle: "rad etilgan",
                        )
                      : Center(
                          child: ListView.separated(
                            padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                            itemCount: rejectedOrders.length,
                            separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(height: 24);
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return RejectedOrder(
                                idOrder: rejectedOrders[index].id,
                                itemsCount: rejectedOrders[index].items.length,
                                orderDate: rejectedOrders[index].orderDate,
                              );
                            },
                          ),
                        ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
