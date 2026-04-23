import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:readmore/readmore.dart';
import 'package:shop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop/common/widgets/products/rating/rating_indicator.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(FImages.profilePicture),
                ),
                const SizedBox(width: FSizes.defaultBtwItems),
                Text("John Doe", style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Iconsax.align_vertically)),
          ],
        ),
        const SizedBox(height: FSizes.defaultBtwItems),

        //Reviews
        Row(
          children: [
            FRatingBarIndicator(rating: 4),
            const SizedBox(width: FSizes.defaultBtwItems),
            Text('01 Nov, 2026', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: FSizes.defaultBtwItems),
        ReadMoreText(
          'The User of this app is quite intuitive. I was able to navigate and make purchase seamlessly. Great job!',
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
          moreStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: FColors.fprimaryColor,
          ),
          lessStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: FColors.fprimaryColor,
          ),
        ),
        const SizedBox(height: FSizes.defaultBtwItems),

        //Company Review Reply
        FRoundedContainer(
          backgroundColor: dark ? FColors.darkergrey : FColors.grey,
          child: Padding(padding: EdgeInsets.all(FSizes.md),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("F's Store " , style: Theme.of(context).textTheme.bodyLarge,),
                  Text("01 Nov, 2026" , style: Theme.of(context).textTheme.bodyMedium,),
                ],
              )
            ],
          ),
          
          ),
        ),
      ],
    );
  }
}
