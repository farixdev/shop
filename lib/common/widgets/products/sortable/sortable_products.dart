



import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shop/common/widgets/layouts/grid_layout.dart';
import 'package:shop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shop/utils/constants/sizes.dart';

class FSortableProducts extends StatelessWidget {
  const FSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Drop Down
        DropdownButtonFormField(
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items:
              [
                    'Name',
                    'Higher Price',
                    'Lower Price',
                    'Sale',
                    'Newest',
                    'Popularity',
                  ]
                  .map(
                    (option) => DropdownMenuItem(
                      value: option,
    
                      child: Text(option),
                    ),
                  )
                  .toList(),
        ),
    
        const SizedBox(height: FSizes.defaultBtwSections),
    
        //Products
        FGridLayout(
          itemCount: 6,
          itemBuilder: (_, index) => FProductCardVertical(),
        ),
      ],
    );
  }
}
