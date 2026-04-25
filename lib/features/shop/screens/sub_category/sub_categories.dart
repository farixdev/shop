import 'package:flutter/material.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/common/widgets/images/rounded_image.dart';
import 'package:shop/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:shop/common/widgets/texts/section_heading.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FAppBar(title: Text('Sport Shirts'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(FSizes.defaultSpace),
          child: Column(
            children: [
              //Banner
              FRoundedImage(
                imageUrl: FImages.shoeBanner,
                width: double.infinity,
                height: null,
                applyImageRadius: true,
              ),
              const SizedBox(height: FSizes.defaultBtwSections),

              //Sub Categoies
              Column(
                children: [
                  ///Heading
                  FSectionHeading(
                    title: 'Sports Shirt',
                    onPressed: () {},
                    showActionButton: true,
                  ),
                  const SizedBox(height: FSizes.defaultBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: FSizes.defaultBtwItems),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => FProductCardHorizontal(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
