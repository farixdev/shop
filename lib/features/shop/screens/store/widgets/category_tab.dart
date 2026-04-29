import 'package:flutter/material.dart';
import 'package:shop/common/widgets/brands/brand_show_case.dart';
import 'package:shop/common/widgets/layouts/grid_layout.dart';
import 'package:shop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:shop/common/widgets/texts/section_heading.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/features/shop/models/product_model.dart';
import 'package:shop/features/shop/models/category_model.dart';
import 'package:get/get.dart';
import 'package:shop/features/shop/controllers/brand_controller.dart';
import 'package:shop/common/widgets/shimmer/brand_shimmer.dart';
import 'package:shop/features/shop/models/brand_model.dart';
import 'package:shop/features/shop/controllers/product_controller.dart';
import 'package:shop/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:shop/features/shop/screens/brand/brand_products.dart';
import 'package:shop/features/shop/screens/all_products/all_products.dart';

class FCategoryTab extends StatelessWidget {
  const FCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(FSizes.defaultSpace),
          child: Column(
            children: [
              ///--Brand
              FutureBuilder(
                future: BrandController.instance.getBrandsForCategory(category.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const FBrandShimmer();
                  }

                  if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
                    return const SizedBox();
                  }

                  final brands = snapshot.data as List<BrandModel>;

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: brands.length > 2 ? 2 : brands.length, // Show up to 2 brands
                    itemBuilder: (_, index) {
                      final brand = brands[index];
                      // Get top 3 product images for this brand from allProducts
                      final brandProducts = controller.allProducts
                          .where((p) => p.brand.toLowerCase() == brand.name.toLowerCase())
                          .toList();
                      final images = brandProducts.map((e) => e.thumbnail).take(3).toList();
                      
                      // Fallback images if brand doesn't have 3 products yet
                      while (images.length < 3) {
                        images.add('https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1899&auto=format&fit=crop');
                      }

                      return FBrandShowcase(
                        brand: brand,
                        onTap: () => Get.to(() => BrandProducts(brand: brand)),
                        images: images,
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: FSizes.defaultBtwItems),

              ///--Products{You Might Like}
              FSectionHeading(
                title: 'You Might Like',
                showActionButton: true,
                onPressed: () => Get.to(() => AllProduct(
                  title: category.name,
                  futureMethod: controller.getCategoryProducts(category.id),
                )),
              ),
              const SizedBox(height: FSizes.defaultBtwItems),

              FutureBuilder(
                future: controller.getCategoryProducts(category.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const FVerticalProductShimmer();
                  }

                  if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
                    return Center(child: Text('No Products Found!', style: Theme.of(context).textTheme.bodyMedium));
                  }

                  final products = snapshot.data as List<ProductModel>;

                  return FGridLayout(
                    itemCount: products.length > 4 ? 4 : products.length, // Limit to 4 products for the preview
                    itemBuilder: (_, index) => FProductCardVertical(product: products[index]),
                  );
                },
              ),
              const SizedBox(height: FSizes.defaultBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}



