import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shop/common/widgets/texts/section_heading.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/sizes.dart';

class FBillingAddressSection extends StatelessWidget {
  const FBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          showActionButton: true,
          onPressed: (){},
        ),
        Text('Faris' , style: Theme.of(context).textTheme.bodyLarge,),

        Row(
          children: [
            const Icon(Iconsax.mobile, color: FColors.grey, size: 16,),
            const SizedBox(width: FSizes.defaultBtwItems,),
            Text('+923456789', style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        const SizedBox(width: FSizes.defaultBtwItems/2),

        Row(
          children: [
            const Icon(Iconsax.location, color: FColors.grey, size: 16,),
            const SizedBox(width: FSizes.defaultBtwItems,),
            Expanded(child: Text('123 Main Street, New York', style: Theme.of(context).textTheme.bodyMedium, softWrap: true ,))
          ],
        ),


      ],
    );
  }
}