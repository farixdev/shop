import 'package:flutter/material.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';

import 'package:shop/common/widgets/products/cart/add_remove_button.dart';
import 'package:shop/common/widgets/products/cart/cart_item.dart';
import 'package:shop/common/widgets/texts/product_price_text.dart';

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
        title: Text('Cart', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: Padding(
        padding: EdgeInsets.all(FSizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, _) =>
              SizedBox(height: FSizes.defaultBtwSections),
          itemCount: 10,
          itemBuilder: (_, index) => Column(
            children: [
              FCartItem(),
              SizedBox(height: FSizes.defaultBtwItems),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 70),
                      //Add & Remove Button
                      FProductQuantityWithAddRemove(),
                    ],
                  ),

                  FProductPriceText(price: '120'),
                ],
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(FSizes.defaultSpace),
        child: ElevatedButton(onPressed: () {}, child: Text('Checkout Rs1230')),
      ),
    );
  }
}
