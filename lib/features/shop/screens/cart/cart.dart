import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';



import 'package:shop/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:shop/features/shop/screens/checkout/checkout.dart';

import 'package:shop/utils/constants/sizes.dart';
//import 'package:shop/utils/helpers/helper_functions.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final dark = FHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: FAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: EdgeInsets.all(FSizes.defaultSpace),
        child:FCartItems()
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(FSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() => CheckoutScreen()), child: Text('Checkout Rs1230')),
      ),
    );
  }
}
