import 'package:flutter/material.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/common/widgets/brands/brand_card.dart';
import 'package:shop/common/widgets/products/sortable/sortable_products.dart';
import 'package:shop/utils/constants/sizes.dart';

import 'package:get/get.dart';
import 'package:shop/features/shop/controllers/product_controller.dart';
import 'package:shop/features/shop/models/brand_model.dart';
import 'package:shop/features/shop/models/product_model.dart';
import 'package:shop/common/widgets/shimmer/vertical_product_shimmer.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    return Scaffold(
      appBar: FAppBar(title: Text(brand.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(FSizes.defaultSpace),
          child: Column(
            children: [
              //Brand Details
              FBrandCard(showBorder: true, brand: brand),
              const SizedBox(height: FSizes.defaultBtwSections),

              FutureBuilder(
                future: controller.getBrandProducts(brand.name),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const FVerticalProductShimmer();
                  }

                  if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
                    return Center(child: Text('No Products Found!', style: Theme.of(context).textTheme.bodyMedium));
                  }

                  final products = snapshot.data as List<ProductModel>;
                  return FSortableProducts(products: products);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}