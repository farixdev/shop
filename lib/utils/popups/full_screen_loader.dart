import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shop/common/widgets/loaders/animation_loaders.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

//a utility class to manage  a full screen loader
class FFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: FHelperFunctions.isDarkMode(Get.context!)
              ? FColors.dark
              : FColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250,),
              FAnimationLoaderWidget(text: text, animation: animation),

            ],
          ),
        ),
      ),
    );
  }

  // ignore: strict_top_level_inference
  static stopLoading()
  {
    Navigator.of(Get.overlayContext!).pop();
  }


}
