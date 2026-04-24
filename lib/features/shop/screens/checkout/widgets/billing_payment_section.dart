import 'package:flutter/material.dart';
import 'package:shop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop/common/widgets/texts/section_heading.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class FBillingPaymentSection extends StatelessWidget {
  const FBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        FSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          showActionButton: true,
          onPressed: (){},
        ),
        const SizedBox(height: FSizes.defaultBtwItems / 2),
        Row(
          children: [
            FRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark? FColors.light : FColors.white ,
              padding: EdgeInsets.all(FSizes.sm),
              child: Image(image:  AssetImage(FImages.facebook) , fit: BoxFit.contain,),
            ),
            const SizedBox(height: FSizes.defaultBtwItems / 2),
            Text('PayPal' , style: Theme.of(context).textTheme.bodyLarge,)
          ],
        )
      ],
    );
  }
}
