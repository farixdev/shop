import 'package:flutter/material.dart ';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import 'package:shop/common/styles/shadows.dart';

import 'package:shop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop/common/widgets/icons/f-circular-icon.dart';
import 'package:shop/common/widgets/images/rounded-image.dart';
import 'package:shop/common/widgets/products/product_price_text.dart';
import 'package:shop/common/widgets/texts/product_title_text.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class FProductCardVertical extends StatelessWidget {
  const FProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [FShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(FSizes.productImageRadius),
          color: dark ? FColors.darkergrey : FColors.white,
        ),
        child: Column(
          children: [
            //Thumbnail, Whishlist Button, Discount Tag
            FRoundedContainer(
              height: 180,
              padding: EdgeInsets.zero,
              backgroundColor: dark ? FColors.dark : FColors.light,
              child: Stack(
                children: [
                  //-Thumbnail Image
                  FRoundedImage(
                    imageUrl: FImages.tshirt1,
                    applyImageRadius: true,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),

                  //Sale Tag
                  Positioned(
                    top: 12,
                    left: 6,
                    child: FRoundedContainer(
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
                  ),

                  //favourite Icon Button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: FCircularIcon(
                      icon: Iconsax.heart,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: FSizes.defaultBtwItems / 2),

            //-- Detail
            Padding(
              padding: EdgeInsets.only(left: FSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FProductTitleText(title: 'T-Shirt Black', smallSize: true),
                  SizedBox(height: FSizes.defaultBtwItems / 2),
                  Row(
                    children: [
                      Text(
                        'Brand',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      SizedBox(width: FSizes.xs),
                      Icon(
                        Iconsax.verify,
                        color: FColors.primaryColor,
                        size: FSizes.iconXs,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Spacer(),

            //price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //price
                Padding(
                  padding: EdgeInsetsGeometry.only(left: FSizes.sm),
                  child: FProductPriceText(price: '600'),
                  ),

                //Add to cart button
                Container(
                  decoration: BoxDecoration(
                    color: FColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(FSizes.cardRadiusMd),
                      bottomRight: Radius.circular(FSizes.productImageRadius),
                    ),
                  ),

                  child: SizedBox(
                    width: FSizes.iconLg * 1.2,
                    height: FSizes.iconLg * 1.2,

                    child: Center(
                      child: Icon(Iconsax.add_circle, color: FColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
