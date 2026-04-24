import 'package:flutter/material.dart';
import 'package:shop/common/widgets/products/cart/add_remove_button.dart';
import 'package:shop/common/widgets/products/cart/cart_item.dart';
import 'package:shop/common/widgets/texts/product_price_text.dart';
import 'package:shop/utils/constants/sizes.dart';

class FCartItems extends StatelessWidget {
  const FCartItems({super.key, this.showAddRemoveButton = true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, _) => SizedBox(height: FSizes.defaultBtwSections),
      itemCount: 10,
      itemBuilder: (_, index) => Column(
        children: [
          //Cart Item
          FCartItem(),
          if (showAddRemoveButton) SizedBox(height: FSizes.defaultBtwItems),
          if (showAddRemoveButton)
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
    );
  }
}
