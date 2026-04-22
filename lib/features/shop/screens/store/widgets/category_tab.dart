import 'package:flutter/material.dart';
import 'package:shop/common/widgets/brands/brand_show_case.dart';
import 'package:shop/common/widgets/layouts/grid_layout.dart';
import 'package:shop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shop/common/widgets/texts/section_heading.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/constants/sizes.dart';

class FCategoryTab extends StatelessWidget {
  const FCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.all(FSizes.defaultSpace),
          child: Column(
            children: [
              ///--Brand
              FBrandShowcase(
                images: [FImages.tshirt1, FImages.sneakers1, FImages.watch1],
              ),
              const SizedBox(height: FSizes.defaultBtwItems),

              ///--Products{You Might Like}
              FSectionHeading(
                title: 'You Might Like',
                showActionButton: true,
                onPressed: () {},
              ),
              const SizedBox(height: FSizes.defaultBtwItems),

              FGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => FProductCardVertical(),
              ),
              const SizedBox(height: FSizes.defaultBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
