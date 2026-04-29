
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shop/common/widgets/brands/brand_card.dart';
import 'package:shop/common/widgets/custom_shapes/containers/rounded_container.dart';


import 'package:shop/utils/constants/colors.dart';


import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';



import 'package:shop/features/shop/models/brand_model.dart';

class FBrandShowcase extends StatelessWidget {
  const FBrandShowcase({super.key, required this.images, required this.brand, this.onTap});

  final List<String> images;
  final BrandModel brand;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    
    return FRoundedContainer(
      showBorder: true,
      borderColor: FColors.darkgrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(FSizes.md),
      margin: const EdgeInsets.only(bottom: FSizes.defaultBtwItems),
      child: Column(
        children: [
          //Brand with product Count
          FBrandCard(showBorder: false, brand: brand, onTap: onTap),
          const SizedBox(height: FSizes.defaultBtwItems),

          //Brand top 3 product images
          Row(
            children: images.map((image) => brandTopProductImageWidget(image, context)).toList()
          ),
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    final dark = FHelperFunctions.isDarkMode(context);
    return Expanded(
      child: FRoundedContainer(
        height: 100,
        padding: const EdgeInsets.all(FSizes.md),
        margin: const EdgeInsets.only(right: FSizes.sm),
        backgroundColor: dark ? FColors.darkergrey : FColors.light,
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.contain,
          progressIndicatorBuilder: (context, url, progress) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}


