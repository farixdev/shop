import 'package:flutter/material.dart ';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import 'package:shop/common/styles/shadows.dart';

import 'package:shop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop/common/widgets/icons/f-circular-icon.dart';
import 'package:shop/common/widgets/images/rounded_image.dart';

import 'package:shop/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:shop/common/widgets/texts/product_price_text.dart';
import 'package:shop/common/widgets/texts/product_title_text.dart';
import 'package:shop/features/shop/screens/product_details/product_detail.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

import 'package:shop/features/shop/models/product_model.dart';

import 'package:shop/features/shop/controllers/favorites_controller.dart';
import 'package:shop/features/shop/controllers/cart_controller.dart';

class FProductCardVertical extends StatelessWidget {
  const FProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoritesController());
    final dark = FHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
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
                    imageUrl: product.thumbnail,
                    applyImageRadius: true,
                    isNetworkImage: true,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),

                  //Sale Tag
                  if (product.salePrice > 0)
                    Positioned(
                      top: 12,
                      left: 6,
                      child: FRoundedContainer(
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
                    ),

                  //favourite Icon Button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Obx(() => FCircularIcon(
                      icon: controller.isFavourite(product.id) ? Iconsax.heart : Iconsax.heart,
                      color: controller.isFavourite(product.id) ? Colors.red : null,
                      onPressed: () => controller.toggleFavoriteProduct(product.id),
                    )),
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
                  FProductTitleText(title: product.title, smallSize: true),
                  SizedBox(height: FSizes.defaultBtwItems / 2),
                  FBrandTitleTextWithVerifiedIcon(title: product.brand, textAlign: TextAlign.left,)
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
                  padding: EdgeInsets.only(left: FSizes.sm),
                  child: FProductPriceText(price: product.price.toString()),
                  ),



                //Add to cart button
                GestureDetector(
                  onTap: () => Get.put(CartController()).addProductToCart(product),
                  child: Container(
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
                        child: Obx(() {
                          final count = Get.put(CartController()).getProductQuantityInCart(product.id);
                          return count > 0 
                            ? Text('$count', style: Theme.of(context).textTheme.bodyLarge!.apply(color: FColors.white))
                            : const Icon(Iconsax.add_circle, color: FColors.white);
                        }),
                      ),
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

