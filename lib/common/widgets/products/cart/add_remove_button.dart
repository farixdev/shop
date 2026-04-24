


import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shop/common/widgets/icons/f-circular-icon.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class FProductQuantityWithAddRemove extends StatelessWidget {
  const FProductQuantityWithAddRemove({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize:  MainAxisSize.min,
      children: [
        FCircularIcon(
          icon: Iconsax.minus_copy,
          width: 32,
          height: 32,
          size: FSizes.md,
          color: dark ? FColors.white : FColors.black,
          backgroundColor: dark
              ? FColors.darkergrey
              : FColors.light,
        ),
        SizedBox(width: FSizes.defaultBtwItems),
        Text(
          '2',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(width: FSizes.defaultBtwItems),
    
        FCircularIcon(
          icon: Iconsax.add_copy,
          width: 32,
          height: 32,
          size: FSizes.md,
          color: FColors.white,
          backgroundColor: FColors.fprimaryColor,
        ),
      ],
    );
  }
}
