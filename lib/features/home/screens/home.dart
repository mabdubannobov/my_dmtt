import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dmtt/constants/labels.dart';
import 'package:my_dmtt/constants/app_assets.dart';
import 'package:my_dmtt/features/home/screens/products_screen.dart';
import 'package:my_dmtt/models/product_model.dart';

import '../../../models/dmtt_model.dart';
import '../../../models/user_model.dart';
import '../bloc/home_bloc.dart';
import '../widgets/action_button.dart';
import '../widgets/section_title.dart';
import '../widgets/product_search.dart';
import '../widgets/persistent_header.dart';
import '../widgets/product_home_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetUSerDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return Center(
            child: CupertinoActivityIndicator(color: Theme.of(context).primaryColor),
          );
        }
        UserModel userModel = state is HomeLoadedState ? state.userModel : UserModel.defaultModel();
        DmttModel dmttModel = state is HomeLoadedState ? state.dmttModel : DmttModel.defaultModel();
        List<ProductModel> products = state is HomeLoadedState ? state.products : [ProductModel.defaultModel()];

        return CustomScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              sliver: SliverAppBar(
                floating: false,
                expandedHeight: 56,
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CachedNetworkImage(
                    imageUrl: userModel.imageUrl!,
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${userModel.firstName} ${userModel.lastName}",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      "${dmttModel.name}, ${userModel.district}",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                actions: [
                  ActionButton(icon: AppAssets.icons.scan),
                  const SizedBox(width: 16),
                  ActionButton(icon: AppAssets.icons.notification),
                ],
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: PersistentHeader(
                widget: const ProductSearch(),
              ),
            ),
            SectionTitle(
              title: "Yangiliklar 🔥",
              onTap: () {},
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36),
                    image: DecorationImage(
                      image: AssetImage(AppAssets.images.offer),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ]),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 100,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Column(
                      children: [
                        Image.asset(
                          width: 48,
                          height: 58,
                          categoryImages[index],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          categoryNames[index],
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    );
                  },
                  childCount: 8,
                ),
              ),
            ),
            SectionTitle(
              title: "Mahsulotlar 👌",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductsScreen(allProducts: products),
                  ),
                );
              },
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 150 + (MediaQuery.of(context).size.width / 2 - 24 - 48),
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: products.length,
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ProductHomeContainer(
                      productImage: products[index].imageUrl ??
                          "https://ik.imagekit.io/rjt7sz5ns/noPhoto.png?updatedAt=1714584632953",
                      productTitle: products[index].name,
                      productQuantity: safeParseDouble(products[index].count),
                      productMeasure: products[index].measure,
                      companyId: 2,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 16);
                  },
                  padding: const EdgeInsets.all(16),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

double safeParseDouble(String? value, [double fallback = 0.0]) {
  return double.tryParse(value ?? '') ?? fallback;
}
