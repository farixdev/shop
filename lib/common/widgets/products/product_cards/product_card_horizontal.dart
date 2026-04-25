import 'package:flutter/material.dart';
import 'package:shop/common/styles/shadows.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class FProductCardHorizontal extends StatelessWidget {
  const FProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);
    return Container(
      width: 180,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(  
        boxShadow: [FShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(FSizes.productImageRadius),
        color: dark ? FColors.darkergrey : FColors.white,
      ),
    );
  }
}
