import 'package:flutter/material.dart';

import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shop/common/styles/shadows.dart';
import 'package:shop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop/common/widgets/icons/f-circular-icon.dart';
import 'package:shop/common/widgets/images/rounded_image.dart';
import 'package:shop/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:shop/common/widgets/texts/product_price_text.dart';
import 'package:shop/common/widgets/texts/product_title_text.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class FProductCardHorizontal extends StatelessWidget {
  const FProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [FShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(FSizes.productImageRadius),
        color: dark ? FColors.darkergrey : FColors.white,
      ),
      child: Row(
        children: [
          ///Thumbnail
          FRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(FSizes.sm),
            backgroundColor: dark ? FColors.dark : FColors.light,
            child: Stack(
              children: [
                //-Thumbnail Image
                SizedBox(
                  width: 120,
                  height: 120,
                  child: FRoundedImage(
                    imageUrl: FImages.tshirt1,
                    applyImageRadius: true,
                  ),
                ),

                ///Sale TAg
                Positioned(
                  top: 12,
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

                //Favourite Icon
                Positioned(
                  top: 0,
                  right: 0,
                  child: FCircularIcon(icon: Iconsax.heart, color: Colors.red),
                ),
              ],
            ),
          ),

          ///Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: EdgeInsets.only(top: FSizes.sm, left: FSizes.sm),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FProductTitleText(
                        title: 'T-Shirt Black Printed',
                        smallSize: true,
                      ),
                      const SizedBox(height: FSizes.defaultBtwItems / 2),
                      FBrandTitleTextWithVerifiedIcon(title: 'Nike'),
                    ],
                  ),
                  Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Pricing
                      Flexible(child: FProductPriceText(price: '123'),),

                      ///Add to cart
                      Container(
                        decoration: BoxDecoration(
                          color: FColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(FSizes.cardRadiusMd),
                            bottomRight: Radius.circular(
                              FSizes.productImageRadius,
                            ),
                          ),
                        ),

                        child: SizedBox(
                          width: FSizes.iconLg * 1.2,
                          height: FSizes.iconLg * 1.2,

                          child: Center(
                            child: Icon(
                              Iconsax.add_copy,
                              color: FColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
