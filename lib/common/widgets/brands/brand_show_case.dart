
import 'package:flutter/material.dart';

import 'package:shop/common/widgets/brands/brand_card.dart';
import 'package:shop/common/widgets/custom_shapes/containers/rounded_container.dart';


import 'package:shop/utils/constants/colors.dart';


import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';



class FBrandShowcase extends StatelessWidget {
  const FBrandShowcase({super.key, required this.images});

  final List<String> images;
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
          const FBrandCard(showBorder: false , productCount: '250' ,),
          const SizedBox(height: FSizes.defaultBtwItems),

          //Brand top 3 profuct images
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
        child:  Image(
          fit: BoxFit.contain,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
