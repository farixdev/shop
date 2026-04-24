import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class FSingleAddress extends StatelessWidget {
  const FSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);
    return FRoundedContainer(
      width: double.infinity,
      showBorder: true,

      backgroundColor: selectedAddress  
          // ignore: deprecated_member_use
          ? FColors.fprimaryColor.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
          ? FColors.darkergrey
          : FColors.grey,
      margin: EdgeInsets.only(bottom: FSizes.defaultBtwItems),
      child: Stack(
        children: [
          Icon(
            selectedAddress? Iconsax.tick_circle_copy : null,
            color: selectedAddress? dark? FColors.light :   FColors.dark : null,
          )
        ],
      )
    );
  }
}
