import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shop/common/widgets/custom_shapes/containers/circular_container.dart';

import 'package:shop/common/widgets/images/rounded_image.dart';
import 'package:shop/features/shop/controllers/home_controller.dart';
import 'package:shop/utils/constants/colors.dart';



import 'package:shop/utils/constants/sizes.dart';

class FPromoSlider extends StatelessWidget {
  const FPromoSlider({super.key, required this.banners});

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          items: banners.map((url) =>  FRoundedImage(imageUrl: url)) . toList(),
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
        ),
        const SizedBox(height: FSizes.defaultBtwItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
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
        ),
      ],
    );
  }
}
