import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shop/features/authentication/controllers/onboarding/onboarding_controller.dart';

import 'package:shop/utils/constants/colors.dart';

import 'package:shop/utils/constants/sizes.dart';

import 'package:shop/utils/device/device_utility.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);
    return Positioned(
      right: FSizes.defaultSpace,
      bottom: FDeviceUtility.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark ? FColors.fprimaryColor : Colors.black,
        ),
        child: const Icon(Iconsax.arrow_right_1),
      ),
    );
  }
}
