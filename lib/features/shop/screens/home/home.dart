
import 'package:flutter/material.dart';


import 'package:shop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:shop/common/widgets/custom_shapes/containers/search_container.dart';


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
                        FHomeCategory(),
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
              child: FPromoSlider(banners: [FImages.watchBanner , FImages.shoeBanner , FImages.clothBanner],),
            ),
          ],
        ),
      ),
    );
  }
}

