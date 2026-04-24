
import 'package:flutter/material.dart';
import 'package:shop/common/widgets/images/rounded_image.dart';
import 'package:shop/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:shop/common/widgets/texts/product_title_text.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class FCartItem extends StatelessWidget {
  const FCartItem({
    super.key,
    
  });
  

  

  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        ///Image
        FRoundedImage(
          imageUrl: FImages.tshirt1,
          width: 60,
          height: 60,
          padding: EdgeInsets.all(FSizes.md),
          backgroundColor: dark
              ? FColors.darkergrey
              : FColors.light,
        ),
        const SizedBox(width: FSizes.defaultBtwItems),
    
        //Title, Price & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FBrandTitleTextWithVerifiedIcon(title: 'Nike'),
              Flexible(
                child: FProductTitleText(
                  title: 'T-Shirt Custom Printed',
                  maxLines: 1,
                ),
              ),
              //Atributes
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Color',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'Green',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'Size',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'UK 08',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
