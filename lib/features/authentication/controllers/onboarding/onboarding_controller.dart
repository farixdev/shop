import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  ///variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  //update current index whwen page changes
  void updatePageIndicator(index) => currentPageIndex.value = index;

  //jump to the specfic dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  //Update current index and jump to the next page
  void nextPage() {}

  //Update current index and jump to the last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpTo(2);
  }
}
