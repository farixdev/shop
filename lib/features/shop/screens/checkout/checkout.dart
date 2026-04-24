import 'package:flutter/material.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: FAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(FSizes.defaultSpace),
          child: Column(
            children: [
              //Items in cart
              FCartItems(showAddRemoveButton: false),
              const SizedBox(height: FSizes.defaultBtwSections),

              //Coupon TextField
              FRoundedContainer(
                showBorder: true,
                backgroundColor: dark ? FColors.dark : FColors.white,
                padding: EdgeInsets.only(
                  top: FSizes.sm,
                  bottom: FSizes.sm,
                  left: FSizes.md,
                  right: FSizes.sm,
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Have a promo code? Enter here',
                          
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: FSizes.defaultBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
