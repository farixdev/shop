import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shop/common/widgets/appbar/appbar.dart';

import 'package:shop/common/widgets/appbar/tabbar.dart';
import 'package:shop/common/widgets/brands/brand_card.dart';

import 'package:shop/common/widgets/custom_shapes/containers/search_container.dart';

import 'package:shop/common/widgets/layouts/grid_layout.dart';
import 'package:shop/common/widgets/products/cart/cart_menu_icon.dart';

import 'package:shop/common/widgets/texts/section_heading.dart';
import 'package:shop/features/shop/screens/brand/all_brands.dart';
import 'package:shop/features/shop/screens/brand/brand_products.dart';
import 'package:shop/features/shop/screens/store/widgets/category_tab.dart';
import 'package:shop/features/shop/screens/all_products/search.dart';
import 'package:shop/utils/constants/colors.dart';

import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';
import 'package:shop/features/shop/controllers/brand_controller.dart';
import 'package:shop/common/widgets/shimmer/brand_shimmer.dart';
import 'package:shop/features/shop/controllers/category_controller.dart';
import 'package:shop/features/shop/models/category_model.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    final brandController = Get.put(BrandController());
    final dark = FHelperFunctions.isDarkMode(context);

    return Obx(() {
      if (controller.isLoading.value) return const Scaffold(body: Center(child: CircularProgressIndicator()));

      final categories = controller.featuredCategories;

      return DefaultTabController(
        length: categories.length,
        child: Scaffold(
          appBar: FAppBar(
            title: Text(
              'Store',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            actions: [FCartCounterIcon(onPressed: () {})],
          ),
          body: NestedScrollView(
            headerSliverBuilder: (_, innerboxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: dark ? FColors.black : FColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: EdgeInsets.all(FSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const SizedBox(height: FSizes.defaultBtwItems),
                        FSearchContainer(
                          text: "Search in Store ",
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero,
                          ontap: () => Get.to(() => const SearchScreen()),
                        ),
                        const SizedBox(height: FSizes.defaultBtwSections),


                        FSectionHeading(
                          title: 'Feature Brand',
                          showActionButton: true,
                          onPressed: () => Get.to(() => const AllBrandsScreen()),
                        ),
                        const SizedBox(height: FSizes.defaultBtwItems / 1.5),
                        
                        Obx(() {
                          if (brandController.isLoading.value) return FBrandShimmer();

                          if (brandController.featuredBrands.isEmpty) {
                            return Center(child: Text('No Brands Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
                          }

                          return FGridLayout(
                            itemCount: brandController.featuredBrands.length,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              final brand = brandController.featuredBrands[index];
                              return FBrandCard(
                                showBorder: false,
                                brand: brand,
                                onTap: () => Get.to(() => BrandProducts(brand: brand)),
                              );
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                  bottom: FTabBar(
                    tabs: categories.map((category) => Tab(child: Text(category.name))).toList(),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: categories.map((category) => FCategoryTab(category: category)).toList(),
            ),
          ),
        ),
      );
    });
  }
}

