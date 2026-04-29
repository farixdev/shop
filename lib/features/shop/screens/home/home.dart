import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:shop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:shop/common/widgets/layouts/grid_layout.dart';
import 'package:shop/common/widgets/products/product_cards/product_card_vertical.dart';

import 'package:shop/common/widgets/texts/section_heading.dart';
import 'package:shop/features/shop/screens/all_products/all_products.dart';
import 'package:shop/features/shop/screens/all_products/search.dart';
import 'package:shop/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:shop/features/shop/screens/home/widgets/home_categories.dart';
import 'package:shop/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/image_strings.dart';

import 'package:shop/utils/constants/sizes.dart';

import 'package:shop/features/shop/controllers/product_controller.dart';
import 'package:shop/common/widgets/shimmer/vertical_product_shimmer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FPrimaryHeaderContainer(
              child: Column(
                children: [
                  ///Appbar
                  const FHomeAppBar(),
                  const SizedBox(height: FSizes.defaultBtwSections),
                  //Search Bar
                  FSearchContainer(
                    text: 'Search in Store',
                    ontap: () => Get.to(() => const SearchScreen()),
                  ),
                  const SizedBox(height: FSizes.defaultBtwSections),
                  //Catogories
                  Padding(
                    padding: EdgeInsets.only(left: FSizes.defaultSpace),
                    child: Column(
                      children: [
                        //heading
                        FSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: FColors.white,
                        ),
                        const SizedBox(height: FSizes.defaultBtwItems),
                        //catogery
                        FHomeCategory(
                         
                        ),
                        const SizedBox(height: FSizes.defaultBtwSections),
                        const SizedBox(height: FSizes.defaultBtwItems),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //body

            //carousel
            Padding(
              padding: EdgeInsets.all(FSizes.md),
              child: Column(
                children: [
                  const FPromoSlider(),
                  const SizedBox(height: FSizes.defaultBtwSections),

                  //heading
                  FSectionHeading(
                    title: 'Popular Products',
                    onPressed: () => Get.to(() => AllProduct()),
                    showActionButton: true,
                  ),
                  const SizedBox(height: FSizes.defaultBtwItems),

                  //POPULAR PRODUCTS
                  Obx(() {
                    if (controller.isLoading.value) return const FVerticalProductShimmer();

                    if (controller.featuredProducts.isEmpty) {
                      return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium));
                    }

                    return FGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) => FProductCardVertical(product: controller.featuredProducts[index]),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
