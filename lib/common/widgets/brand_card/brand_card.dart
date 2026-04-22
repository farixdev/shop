import 'package:flutter/material.dart';
import 'package:shop/common/widgets/custom_shapes/containers/rounded_container.dart';

import 'package:shop/common/widgets/images/circular_image.dart';

import 'package:shop/common/widgets/texts/brand_title_with_verified_icon.dart';

import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/enums.dart';
import 'package:shop/utils/constants/image_strings.dart';

import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class FBrandCard extends StatelessWidget {
  const FBrandCard({super.key, this.showBorder = true});

  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: FRoundedContainer(
        padding: const EdgeInsets.all(FSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            ///-Icon
            Flexible(
              child: FCircularImage(
                image: FImages.phoneIcon,
                backgroundColor: Colors.transparent,
                overlayColor: dark ? FColors.white : FColors.black,
              ),
            ),

            const SizedBox(height: FSizes.defaultBtwItems / 1.5),

            ///-Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FBrandTitleTextWithVerifiedIcon(
                    title: 'Nike',
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '256 products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
