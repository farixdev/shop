import 'package:flutter/material.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class FBottomAddToCart extends StatelessWidget {
  const FBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: FSizes.defaultSpace, vertical: FSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark? FColors.darkergrey : FColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(FSizes.cardRadiusLg),
          topRight: Radius.circular(FSizes.cardRadiusLg), 
        )
      ),
    );
  }
}