import 'package:flutter/material.dart';
import 'package:shop/utils/constants/sizes.dart';

class FBillingPaymentSection extends StatelessWidget {
  const FBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium,),
            Text('Rs1234', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: FSizes.defaultBtwItems / 2),

         //Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium,),
            Text('Rs200', style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),

          //Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium,),
            Text('Rs70', style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        const SizedBox(height: FSizes.defaultBtwItems / 2),

        
          //Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total ', style: Theme.of(context).textTheme.bodyMedium,),
            Text('Rs70', style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
      ],
    );
  }
}
