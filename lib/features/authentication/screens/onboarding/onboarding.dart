import 'package:flutter/material.dart';
import 'package:shop/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:shop/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/constants/text_strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


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
          SmoothPageIndicator(controller: PageController(), count: 3)
          ///Circular butoon
        ],
      ),
    );
  }
}


