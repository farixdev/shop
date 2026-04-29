import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shop/common/widgets/custom_shapes/containers/circular_container.dart';

import 'package:shop/common/widgets/images/rounded_image.dart';
import 'package:shop/features/shop/controllers/home_controller.dart';
import 'package:shop/utils/constants/colors.dart';



import 'package:shop/utils/constants/sizes.dart';

import 'package:shop/features/shop/controllers/banner_controller.dart';
import 'package:shop/common/widgets/shimmer/shimmer.dart';

class FPromoSlider extends StatelessWidget {
  const FPromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      if (controller.isLoading.value) return FShimmerEffect(width: double.infinity, height: 190);
      if (controller.banners.isEmpty) return const SizedBox();

      return Column(
        children: [
          CarouselSlider(
            items: controller.banners
                .map((banner) => FRoundedImage(
                      imageUrl: banner.imageUrl,
                      isNetworkImage: true,
                      onPressed: () => Get.toNamed(banner.targetScreen),
                    ))
                .toList(),
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) => controller.updatePageIndicator(index),
            ),
          ),
          const SizedBox(height: FSizes.defaultBtwItems),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < controller.banners.length; i++)
                  FCircularContainer(
                    margin: const EdgeInsets.only(right: 10),
                    width: 20,
                    height: 4,
                    backgroundColor: controller.carousalCurrentIndex.value == i
                        ? FColors.fprimaryColor
                        : FColors.grey,
                  ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
