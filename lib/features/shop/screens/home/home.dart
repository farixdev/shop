import 'package:flutter/material.dart';

import 'package:shop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:shop/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:shop/common/widgets/layouts/grid_layout.dart';
import 'package:shop/common/widgets/products/product_cards/product_card_vertical.dart';

import 'package:shop/common/widgets/texts/section_heading.dart';
import 'package:shop/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:shop/features/shop/screens/home/widgets/home_categories.dart';
import 'package:shop/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/image_strings.dart';

import 'package:shop/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  const FSearchContainer(text: 'Search in Store'),
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
                          categories: [
                            {'title': 'Sports', 'image': FImages.bowlingIcon},
                            {'title': 'Chair', 'image': FImages.chairIcon},
                            {
                              'title': 'Beauty',
                              'image': FImages.cosemeticsIcon,
                            },
                            {
                              'title': 'Jewellery',
                              'image': FImages.diamondIcon,
                            },
                            {'title': 'Gadgets', 'image': FImages.phoneIcon},
                            {'title': 'Toys', 'image': FImages.toyCarIcon},
                            {'title': 'Shoes', 'image': FImages.womenShoesIcon},
                          ],
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
                  FPromoSlider(
                    banners: [
                      FImages.watchBanner,
                      FImages.shoeBanner,
                      FImages.clothBanner,
                    ],
                  ),
                  const SizedBox(height: FSizes.defaultBtwSections),

                  //heading
                  FSectionHeading(title: 'Popular Products', onPressed: (){} , showActionButton: true),
                  const SizedBox(height: FSizes.defaultBtwItems),

                  //POPULAR PRODUCTS
                  FGridLayout(itemCount: 4, itemBuilder: (_, index) => FProductCardVertical(),)
                  ,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

