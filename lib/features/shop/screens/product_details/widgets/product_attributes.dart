import 'package:flutter/material.dart';
import 'package:shop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop/common/widgets/texts/product_price_text.dart';
import 'package:shop/common/widgets/texts/product_title_text.dart';
import 'package:shop/common/widgets/texts/section_heading.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// -Selected Attribute Pricing   & Description
        FRoundedContainer(
          padding: EdgeInsets.all(FSizes.md),
          backgroundColor: dark ? FColors.darkergrey : FColors.grey,
          child: Column(
            children: [
              //Titel, price and stock status
              Row(
                children: [
                  FSectionHeading(title: 'Variation'),
                  SizedBox(width: FSizes.defaultBtwItems),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          FProductTitleText(title: 'Price: ', smallSize: true),

                          //Actual Price
                          Text(
                            'Rs250',
                            style: Theme.of(context).textTheme.titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(width: FSizes.defaultBtwItems),

                          //Sale Price
                          FProductPriceText(price: '150'),
                        ],
                      ),

                      ///Stack
                      Row(
                        children: [
                          FProductTitleText(title: 'Status: ', smallSize: true),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              //Variation Description
              FProductTitleText(
                title:
                    'This is the description of the product and it can go upto 4 lines',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
