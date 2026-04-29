import 'package:flutter/material.dart';

import 'package:shop/common/widgets/appbar/appbar.dart';

import 'package:shop/common/widgets/products/sortable/sortable_products.dart';
import 'package:shop/utils/constants/sizes.dart';

import 'package:get/get.dart';
import 'package:shop/features/shop/controllers/product_controller.dart';
import 'package:shop/features/shop/models/product_model.dart';
import 'package:shop/common/widgets/shimmer/vertical_product_shimmer.dart';

class AllProduct extends StatelessWidget {
  const AllProduct({super.key, this.title = 'Popular Products', this.futureMethod});

  final String title;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    return Scaffold(
      appBar: FAppBar(title: Text(title), showBackArrow: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(FSizes.defaultSpace),
        child: futureMethod != null
            ? FutureBuilder(
                future: futureMethod,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const FVerticalProductShimmer();
                  }
                  if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
                    return Center(child: Text('No Products Found!', style: Theme.of(context).textTheme.bodyMedium));
                  }
                  return FSortableProducts(products: snapshot.data as List<ProductModel>);
                },
              )
            : Obx(() {
                if (controller.isLoading.value) return const Center(child: CircularProgressIndicator());
                return FSortableProducts(products: controller.allProducts);
              }),
      ),
    );
  }
}


