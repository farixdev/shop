import 'package:flutter/material.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/common/widgets/products/cart/coupon_widget.dart';

import 'package:shop/features/shop/screens/cart/widgets/cart_items.dart';

import 'package:shop/utils/constants/sizes.dart';
//import 'package:shop/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final dark = FHelperFunctions.isDarkMode(context);
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
              FCouponCode(),
              const SizedBox(height: FSizes.defaultBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}

