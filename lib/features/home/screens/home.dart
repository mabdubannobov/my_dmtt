import 'package:flutter/material.dart';
import 'package:my_dmtt/constants/labels.dart';
import 'package:my_dmtt/constants/app_assets.dart';

import '../widgets/action_button.dart';
import '../widgets/section_title.dart';
import '../widgets/product_search.dart';
import '../widgets/persistent_header.dart';
import '../../../constants/app_colors.dart';
import '../widgets/product_home_container.dart';
import '../../../constants/app_text_styles.dart';

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
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
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
            child: SizedBox(
              height: 369,
              child: ListView.separated(
                itemCount: 3,
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ProductHomeContainer(
                    productImage: AppAssets.images.productTomato,
                    productTitle: "Pomidor",
                    productQuantity: 43,
                    productSeller: "Abdusalom Yuk...",
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 16);
                },
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
