import 'package:flutter/material.dart';
import 'package:shop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop/common/widgets/images/circular_image.dart';
import 'package:shop/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:shop/common/widgets/texts/product_price_text.dart';
import 'package:shop/common/widgets/texts/product_title_text.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/enums.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/constants/sizes.dart';

import 'package:shop/utils/helpers/helper_functions.dart';

class FProductMetaData extends StatelessWidget {
  const FProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Price & Sale Price
        Row(
          children: [
            //Sale Tag
            FRoundedContainer(
              radius: FSizes.sm,
              // ignore: deprecated_member_use
              backgroundColor: FColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                horizontal: FSizes.sm,
                vertical: FSizes.xs,
              ),
              child: Text(
                '20%',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.apply(color: FColors.black),
              ),
            ),
            const SizedBox(width: FSizes.defaultBtwItems),
            //Price
            Text(
              'Rs250',
              style: Theme.of(context).textTheme.titleSmall!.apply(
                decoration: TextDecoration.lineThrough,
              ),
            ),
            const SizedBox(width: FSizes.defaultBtwItems),
            FProductPriceText(price: '175', isLarge: true),
          ],
        ),

        const SizedBox(width: FSizes.defaultBtwItems / 1.5),

        ///Title
        FProductTitleText(title: 'Designed Printed T-Shirt'),
        const SizedBox(width: FSizes.defaultBtwItems / 1.5),

        ///Stock Status
        Row(
          children: [
            FProductTitleText(title: 'Status'),
            const SizedBox(width: FSizes.defaultBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),

        const SizedBox(width: FSizes.defaultBtwItems / 1.5),

        ///Brand
        Row(
          children: [
            FCircularImage(
              image: FImages.cosemeticsIcon,
              width: 32, height: 32,
              overlayColor: dark? FColors.white : FColors.black,
              
              ),
            FBrandTitleTextWithVerifiedIcon(title: 'Nike' , brandTextSize: TextSizes.medium,)
          ],
        )
        
      ],
    );
  }
}
