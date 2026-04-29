import 'package:flutter/material.dart';
import 'package:shop/common/widgets/images/circular_image.dart';

import 'package:shop/utils/constants/colors.dart';

import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class FVerticalImageText extends StatelessWidget {
  const FVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = FColors.white,
    this.backgroundColor = Colors.white,
    this.onTap, 
     this.isNetworkImage = true,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: FSizes.defaultBtwItems),
        child: Column(
          children: [
            //circular icon
            FCircularImage(image: image,
            fit: BoxFit.fitWidth,
            padding: FSizes.sm * 1.4,
            isNetworkImage: isNetworkImage,
            backgroundColor: backgroundColor,
            overlayColor: dark? FColors.light : FColors.dark,
            ),
            //Text
            const SizedBox(height: FSizes.defaultBtwItems / 2),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
