import 'package:flutter/material.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/device/device_utility.dart';
import 'package:shop/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final dark = FHelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: FDeviceUtility.getBottomNavigationBarHeight() + 25,
      left: FSizes.defaultSpace,
    
      child: SmoothPageIndicator(
        controller: PageController(),
        count: 3,
        effect: ExpandingDotsEffect(
          activeDotColor: dark? FColors.light: FColors.dark,
          dotHeight: 6,
        ),
      ),
    );
  }
}