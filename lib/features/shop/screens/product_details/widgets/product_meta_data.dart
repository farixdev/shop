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

import 'package:shop/features/shop/models/product_model.dart';

class FProductMetaData extends StatelessWidget {
  const FProductMetaData({super.key, required this.product});

  final ProductModel product;

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
            if (product.salePrice > 0)
              FRoundedContainer(
                radius: FSizes.sm,
                backgroundColor: FColors.secondary.withOpacity(0.8),
                padding: const EdgeInsets.symmetric(
                  horizontal: FSizes.sm,
                  vertical: FSizes.xs,
                ),
                child: Text(
                  '${((1 - (product.salePrice / product.price)) * 100).toStringAsFixed(0)}%',
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge!.apply(color: FColors.black),
                ),
              ),
            if (product.salePrice > 0) const SizedBox(width: FSizes.defaultBtwItems),
            //Price
            if (product.salePrice > 0)
              Text(
                'Rs${product.price}',
                style: Theme.of(context).textTheme.titleSmall!.apply(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            if (product.salePrice > 0) const SizedBox(width: FSizes.defaultBtwItems),
            FProductPriceText(price: (product.salePrice > 0 ? product.salePrice : product.price).toString(), isLarge: true),
          ],
        ),

        const SizedBox(width: FSizes.defaultBtwItems / 1.5),

        ///Title
        FProductTitleText(title: product.title),
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
            FBrandTitleTextWithVerifiedIcon(title: product.brand, brandTextSize: TextSizes.medium,)
          ],
        )
        
      ],
    );
  }
}
