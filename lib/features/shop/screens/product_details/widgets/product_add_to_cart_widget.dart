import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shop/common/widgets/icons/f-circular-icon.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class FBottomAddToCart extends StatelessWidget {
  const FBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: FSizes.defaultSpace,
        vertical: FSizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: dark ? FColors.darkergrey : FColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(FSizes.cardRadiusLg),
          topRight: Radius.circular(FSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween ,
        children: [
          Row(
            children: [
              FCircularIcon(
                icon: Iconsax.minus_copy,
                width: 40,
                height: 40,
                backgroundColor: FColors.darkergrey,
                color: FColors.white,
              ),
              const SizedBox(width: FSizes.defaultBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: FSizes.defaultBtwItems),
              FCircularIcon(
                icon: Iconsax.add_copy,
                width: 40,
                height: 40,
                backgroundColor: FColors.black,
                color: FColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {}, 
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(FSizes.md),
              backgroundColor: FColors.black,
              side: const BorderSide(color: FColors.black)
            ),
            child: const Text('Add to Cart')),
        ],
      ),
    );
  }
}
