import 'package:flutter/material.dart';
import 'package:shop/common/widgets/custom_shapes/containers/rounded_container.dart';
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

                  FProductTitleText(title: 'Price: ' , smallSize: true,),

                  Row(
                    children: [
                      //Actual Price
                      Text(
                      'Rs250',
                      style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
                      )

                      //Sale Price
                    ],
                  ),
                ],
              ),
              //Variation Description
            ],
          ),
        ),
      ],
    );
  }
}
