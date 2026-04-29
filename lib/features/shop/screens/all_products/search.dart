import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/common/widgets/layouts/grid_layout.dart';
import 'package:shop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shop/features/shop/controllers/product_controller.dart';
import 'package:shop/utils/constants/sizes.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    return Scaffold(
      appBar: FAppBar(
        showBackArrow: true,
        title: TextField(
          onChanged: (value) => controller.searchQuery.value = value,
          decoration: const InputDecoration(hintText: 'Search products...', border: InputBorder.none),
          autofocus: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(FSizes.defaultSpace),
          child: Obx(() {
            final results = controller.searchProducts(controller.searchQuery.value);
            
            if (results.isEmpty) {
              return const Center(child: Text('No products found.'));
            }

            return FGridLayout(
              itemCount: results.length,
              itemBuilder: (_, index) => FProductCardVertical(product: results[index]),
            );
          }),
        ),
      ),
    );
  }
}
