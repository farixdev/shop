
import 'package:flutter/material.dart';

import 'package:shop/utils/constants/sizes.dart';

import 'package:shop/utils/device/device_utility.dart';



class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: FDeviceUtility.getAppBarHeight(),
      right: FSizes.defaultSpace,
      child: TextButton(
        onPressed: () {},
        child: const Text("Skip"),
      ),
    );
  }
}
