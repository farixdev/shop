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
import 'package:shop/features/shop/screens/store/widgets/category_tab.dart';
import 'package:shop/utils/constants/colors.dart';

import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
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
                      //--Search Bar--//
                      const SizedBox(height: FSizes.defaultBtwItems),
                      FSearchContainer(
                        text: "Search in Store ",
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),

                      const SizedBox(height: FSizes.defaultBtwSections),

                      //feature Brand
                      FSectionHeading(
                        title: 'Feature Brand',
                        showActionButton: true,
                        onPressed: () => Get.to(() => AllBrandsScreen(  )),
                      ),
                      const SizedBox(height: FSizes.defaultBtwItems / 1.5),

                      FGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return FBrandCard(
                            showBorder: false,
                            productCount: '250',
                          );
                        },
                      ),
                    ],
                  ),
                ),

                //Tabs
                bottom: FTabBar(
                  tabs: [
                    Tab(child: Text('Sports')),
                    Tab(child: Text('Furniture')),
                    Tab(child: Text('Electronics')),
                    Tab(child: Text('Clothes')),
                    Tab(child: Text('Cosmetics')),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              FCategoryTab(),
              FCategoryTab(),
              FCategoryTab(),
              FCategoryTab(),
              FCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
