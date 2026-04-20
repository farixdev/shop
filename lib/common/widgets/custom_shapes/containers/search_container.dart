import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/device/device_utility.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class FSearchContainer extends StatelessWidget {
  const FSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.ontap,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: FSizes.defaultSpace),
        child: Container(
          width: FDeviceUtility.getScreenWidth(context),
          padding: EdgeInsets.all(FSizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                      ? FColors.dark
                      : FColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(FSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: FColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: FColors.darkergrey),
              const SizedBox(width: FSizes.defaultBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
