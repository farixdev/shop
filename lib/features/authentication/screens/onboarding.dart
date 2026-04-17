import 'package:flutter/material.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/constants/text_strings.dart';
import 'package:shop/utils/device/device_utility.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ///horizontal scrollable page view with 3 pages
          PageView(children: [
            OnBoardingPage(image: FImages.onBoardingImage1, title: FTexts.onBoardingTitle1, subTitle: FTexts.onBoardingSubTitle1),
            OnBoardingPage(image: FImages.onBoardingImage2, title: FTexts.onBoardingTitle2, subTitle: FTexts.onBoardingSubTitle2),
            OnBoardingPage(image: FImages.onBoardingImage3, title: FTexts.onBoardingTitle3, subTitle: FTexts.onBoardingSubTitle3),
          ]),


          ///skip button
          const OnBoardingSkip(),
          ///Dot naviagation
          ///Circular butoon
        ],
      ),
    );
  }
}

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

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(FSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: FHelperFunctions.screenWidth() * 0.8,
            height: FHelperFunctions.screenHeight() * 0.6,
            image: AssetImage(image),
          ),

          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: FSizes.defaultBtwItems),

          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
