import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/common/widgets/images/rounded_image.dart';
import 'package:shop/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:shop/common/widgets/texts/section_heading.dart';
import 'package:shop/features/shop/controllers/category_controller.dart';
import 'package:shop/features/shop/controllers/product_controller.dart';
import 'package:shop/features/shop/models/category_model.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/common/widgets/shimmer/horizontal_product_shimmer.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;

    return Scaffold(
      appBar: FAppBar(title: Text(category.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(FSizes.defaultSpace),
          child: Column(
            children: [
              //Banner
              const FRoundedImage(
                imageUrl: FImages.shoeBanner,
                width: double.infinity,
                height: null,
                applyImageRadius: true,
              ),
              const SizedBox(height: FSizes.defaultBtwSections),

              //Sub Categories
              FutureBuilder(
                future: controller.getSubCategories(category.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
                    return Center(child: Text('No Sub Categories Found!', style: Theme.of(context).textTheme.bodyMedium));
                  }

                  final subCategories = snapshot.data as List<CategoryModel>;

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: subCategories.length,
                    itemBuilder: (_, index) {
                      final subCategory = subCategories[index];
                      
                      return FutureBuilder(
                        future: ProductController.instance.getCategoryProducts(subCategory.id),
                        builder: (context, productSnapshot) {
                          if (productSnapshot.connectionState == ConnectionState.waiting) {
                             return const SizedBox(); // Or a shimmer
                          }

                          if (!productSnapshot.hasData || (productSnapshot.data as List).isEmpty) {
                            return const SizedBox();
                          }

                          final products = productSnapshot.data as List;

                          return Column(
                            children: [
                              ///Heading
                              FSectionHeading(
                                title: subCategory.name,
                                onPressed: () {},
                                showActionButton: true,
                              ),
                              const SizedBox(height: FSizes.defaultBtwItems / 2),

                              SizedBox(
                                height: 120,
                                child: ListView.separated(
                                  itemCount: products.length,
                                  separatorBuilder: (context, index) => const SizedBox(width: FSizes.defaultBtwItems),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => FProductCardHorizontal(product: products[index]),
                                ),
                              ),
                              const SizedBox(height: FSizes.defaultBtwSections),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
