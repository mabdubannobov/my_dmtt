import 'package:flutter/material.dart';
import 'package:my_dmtt/constants/app_assets.dart';
import 'package:my_dmtt/constants/labels.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../widgets/action_button.dart';
import '../widgets/product_home_container.dart';
import '../widgets/product_search.dart';
import '../widgets/section_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        scrollDirection: Axis.vertical,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            sliver: SliverAppBar(
              floating: false,
              expandedHeight: 56,
              backgroundColor: Colors.white,
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  width: 48,
                  height: 48,
                  AppAssets.images.userImage,
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Diyorbek Isroilov",
                    style: AppTextStyles.regularStyle.copyWith(
                      color: AppColors.greyscaleLight.shade600,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "1-DMTT, Toshloq",
                    style: AppTextStyles.boldStyle.copyWith(
                      color: AppColors.greyscaleLight.shade900,
                      fontSize: 20,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
              actions: [
                ActionButton(icon: AppAssets.icons.scan),
                const SizedBox(width: 8),
                ActionButton(icon: AppAssets.icons.notification),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverPersistentHeader(
              pinned: true,
              delegate: PersistentHeader(
                widget: const ProductSearch(),
              ),
            ),
          ),
          const SectionTitle(
            title: "Yangiliklar 🔥",
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 24,
                crossAxisSpacing: 20.5,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Column(
                    children: [
                      Image.asset(
                        width: 34,
                        height: 44,
                        categoryImages[index],
                      ),
                      Text(
                        categoryNames[index],
                        style: AppTextStyles.boldStyle.copyWith(
                          fontSize: 16,
                          height: 1.4,
                          letterSpacing: 0.2,
                          color: AppColors.greyscaleLight,
                        ),
                      ),
                    ],
                  );
                },
                childCount: 8,
              ),
            ),
          ),
          const SectionTitle(
            title: "Mahsulotlar 👌",
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 369,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                scrollDirection: Axis.horizontal,
                children: [
                  ProductHomeContainer(
                    productImage: AppAssets.images.productTomato,
                    productTitle: "Pomidor",
                    productQuantity: 43,
                    productSeller: "Abdusalom Yuk...",
                  ),
                  const SizedBox(width: 16),
                  ProductHomeContainer(
                    productImage: AppAssets.images.productMeat,
                    productTitle: "Mol go'shti",
                    productQuantity: 130,
                    productSeller: "Chorvador F/X",
                  ),
                  const SizedBox(width: 16),
                  ProductHomeContainer(
                    productImage: AppAssets.images.productTomato,
                    productTitle: "Pomidor",
                    productQuantity: 43,
                    productSeller: "Abdusalom Yuk...",
                  ),
                  const SizedBox(width: 16),
                  ProductHomeContainer(
                    productImage: AppAssets.images.productMeat,
                    productTitle: "Mol go'shti",
                    productQuantity: 130,
                    productSeller: "Chorvador F/X",
                  ),
                  const SizedBox(width: 16),
                  ProductHomeContainer(
                    productImage: AppAssets.images.productTomato,
                    productTitle: "Pomidor",
                    productQuantity: 43,
                    productSeller: "Abdusalom Yuk...",
                  ),
                  const SizedBox(width: 16),
                  ProductHomeContainer(
                    productImage: AppAssets.images.productMeat,
                    productTitle: "Mol go'shti",
                    productQuantity: 130,
                    productSeller: "Chorvador F/X",
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget widget;

  PersistentHeader({required this.widget});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      width: double.infinity,
      height: 80.0,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        color: Colors.white,
        child: Center(child: widget),
      ),
    );
  }

  @override
  double get maxExtent => 80.0;

  @override
  double get minExtent => 80.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
