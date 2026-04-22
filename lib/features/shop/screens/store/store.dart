import 'package:flutter/material.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/common/widgets/brand_card/brand_card.dart';

import 'package:shop/common/widgets/custom_shapes/containers/search_container.dart';

import 'package:shop/common/widgets/layouts/grid_layout.dart';
import 'package:shop/common/widgets/products/cart/cart_menu_icon.dart';

import 'package:shop/common/widgets/texts/section_heading.dart';
import 'package:shop/utils/constants/colors.dart';

import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: FAppBar(
        title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
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
                      onPressed: () {},
                    ),
                    const SizedBox(height: FSizes.defaultBtwItems / 1.5),

                    FGridLayout(
                      itemCount: 4,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) {
                        return FBrandCard(showBorder: false);
                      },
                    ),
                  ],
                ),
              ),

              //Tabs
              bottom: TabBar(
                isScrollable: true,
                indicatorColor: FColors.primaryColor,
                tabs: [
                  Tab(child: Text('Sports')),
                  Tab(child: Text('Electronics')),
                  Tab(child: Text('Fashion')),
                  Tab(child: Text('Furniture')),
                  Tab(child: Text('Beauty')),
                  ]
                  ),
            ),
          ];
        },
        body: Container(),
      ),
    );
  }
}
