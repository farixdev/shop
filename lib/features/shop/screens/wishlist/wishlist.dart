import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/common/widgets/icons/f-circular-icon.dart';
import 'package:shop/common/widgets/layouts/grid_layout.dart';
import 'package:shop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shop/features/shop/screens/home/home.dart';
import 'package:shop/utils/constants/sizes.dart';

class FavouriteScreen  extends StatelessWidget {
  const FavouriteScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: FAppBar(
        title: Text('Wishlist' , style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          FCircularIcon(icon: Iconsax.add  , onPressed: () => Get.to(HomeScreen()),)
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(FSizes.defaultSpace ),
          child: Column(
            children: [
              FGridLayout(itemCount: 4, itemBuilder: (_, index)=>FProductCardVertical())
            ],
          ),
        
        ),
      ),
    );
  }
}