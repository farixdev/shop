import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/common/widgets/icons/f-circular-icon.dart';
import 'package:shop/common/widgets/layouts/grid_layout.dart';
import 'package:shop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shop/features/shop/screens/home/home.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/features/shop/models/product_model.dart';
import 'package:shop/features/shop/controllers/favorites_controller.dart';
import 'package:shop/common/widgets/shimmer/vertical_product_shimmer.dart';

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
          padding: EdgeInsets.all(FSizes.defaultSpace),
          child: Column(
            children: [
              Obx(() {
                final controller = Get.put(FavoritesController());
                return FutureBuilder(
                  future: controller.favoriteProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const FVerticalProductShimmer();
                    }

                    if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
                      return Center(
                        child: Text('No Favorites Yet!', style: Theme.of(context).textTheme.bodyMedium),
                      );
                    }

                    final products = snapshot.data as List<ProductModel>;
                    return FGridLayout(
                      itemCount: products.length,
                      itemBuilder: (_, index) => FProductCardVertical(product: products[index]),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}