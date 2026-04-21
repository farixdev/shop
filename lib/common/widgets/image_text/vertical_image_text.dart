import 'package:flutter/material.dart';

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
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
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
            Container(
              width: 56,
              height: 56,
              padding: EdgeInsets.all(FSizes.sm),
              decoration: BoxDecoration(
                color:
                    backgroundColor ?? (dark ? FColors.black : FColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(image: AssetImage(image), fit: BoxFit.cover),
              ),
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
