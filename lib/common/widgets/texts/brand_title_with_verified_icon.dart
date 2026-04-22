import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shop/common/widgets/texts/brand_title_text.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/enums.dart';
import 'package:shop/utils/constants/sizes.dart';

class FBrandTitleTextWithVerifiedIcon extends StatelessWidget {
  const FBrandTitleTextWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxlines = 1,
    this.textColor,
    this.iconColor = FColors.primaryColor,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxlines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: FBrandTitleText(
            title: title,
            color: textColor,
            maxlines: maxlines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(width: FSizes.xs),
        Icon(Iconsax.verify, color: iconColor, size: FSizes.iconXs),
      ],
    );
  }
}
