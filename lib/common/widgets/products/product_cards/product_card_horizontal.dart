import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop/common/widgets/icons/f-circular-icon.dart';
import 'package:shop/common/widgets/images/rounded_image.dart';
import 'package:shop/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:shop/common/widgets/texts/product_price_text.dart';
import 'package:shop/common/widgets/texts/product_title_text.dart';
import 'package:shop/features/shop/models/product_model.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';
import 'package:shop/features/shop/controllers/favorites_controller.dart';
import 'package:shop/features/shop/controllers/cart_controller.dart';

class FProductCardHorizontal extends StatelessWidget {
  const FProductCardHorizontal({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoritesController());
    final dark = FHelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(FSizes.productImageRadius),
        color: dark ? FColors.darkergrey : FColors.lightContainer,
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
                    imageUrl: product.thumbnail,
                    applyImageRadius: true,
                    isNetworkImage: true,
                  ),
                ),

                ///Sale TAg
                Positioned(
                  top: 12,
                  child: FRoundedContainer(
                    radius: FSizes.sm,
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
                  child: Obx(() => FCircularIcon(
                    icon: controller.isFavourite(product.id) ? Iconsax.heart : Iconsax.heart_copy,
                    color: controller.isFavourite(product.id) ? Colors.red : null,
                    onPressed: () => controller.toggleFavoriteProduct(product.id),
                  )),
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
                        title: product.title,
                        smallSize: true,
                      ),
                      const SizedBox(height: FSizes.defaultBtwItems / 2),
                      FBrandTitleTextWithVerifiedIcon(title: product.brand),
                    ],
                  ),
                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Pricing
                      Flexible(child: FProductPriceText(price: product.price.toString()),),



                      ///Add to cart
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
                                  : const Icon(Iconsax.add_copy, color: FColors.white);
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
          ),
        ],
      ),
    );
  }
}
