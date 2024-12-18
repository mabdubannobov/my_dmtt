import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dmtt/constants/labels.dart';
import 'package:my_dmtt/constants/app_assets.dart';
import 'package:my_dmtt/models/product_model.dart';

import '../../../models/dmtt_model.dart';
import '../../../models/user_model.dart';
import '../bloc/home_bloc.dart';
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
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetUSerDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }

        UserModel userModel = UserModel(
          firstName: "?",
          lastName: 'Aniqlanmadi',
          district: 'Aniqlanmadi',
        );
        DmttModel dmttModel = DmttModel(name: '?');
        List<ProductModel> products = [
          ProductModel(
            name: "Aniqlanmadi",
            measure: "kg",
            count: "1",
            imageUrl: "https://ik.imagekit.io/rjt7sz5ns/noPhoto.png?updatedAt=1714584632953",
          ),
        ];

        if (state is HomeLoadedState) {
          userModel = state.userModel;
          dmttModel = state.dmttModel;
          products = state.products;
        }

        return CustomScrollView(
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
                      "${userModel.firstName} ${userModel.lastName}",
                      style: AppTextStyles.regularStyle.copyWith(
                        color: AppColors.greyscaleLight.shade600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "${dmttModel.name}, ${userModel.district}",
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
                  const SizedBox(width: 16),
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
                  // crossAxisSpacing: 20.5,
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
                height: 315,
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
                      productQuantity: double.parse(products[index].count!),
                      productMeasure: products[index].measure,
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
