
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';

import 'package:shop/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:shop/common/widgets/icons/f-circular-icon.dart';
import 'package:shop/common/widgets/images/rounded_image.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class FProductImageSlider extends StatelessWidget {
  const FProductImageSlider({
    super.key,
   
  });

  

  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);
    return FCurveEdgeWidget(
      child: Container(
        color: dark ? FColors.darkergrey : FColors.light,
        child: Stack(
          children: [
            //Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(FSizes.productImageRadius * 2),
                child: Center(
                  child: Image(image: AssetImage(FImages.watch1)),
                ),
              ),
            ),
    
            ///Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: FSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: FSizes.defaultBtwItems),
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => FRoundedImage(
                    width: 80,
                    backgroundColor: dark
                        ? FColors.dark
                        : FColors.white,
                    border: Border.all(color: FColors.fprimaryColor),
                    padding: const EdgeInsets.all(FSizes.sm),
                    imageUrl: FImages.tshirt1,
                  ),
                ),
              ),
            ),
            //AppBar ICon
            FAppBar(
              showBackArrow: true,
              actions: [
                FCircularIcon(icon: Iconsax.heart, color: Colors.red  ,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
