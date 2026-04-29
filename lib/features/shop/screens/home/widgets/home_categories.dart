
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:shop/common/widgets/image_text/vertical_image_text.dart';
import 'package:shop/common/widgets/shimmer/category_shimmer.dart';
import 'package:shop/features/shop/controllers/category_controller.dart';
import 'package:shop/features/shop/screens/sub_category/sub_categories.dart';


class FHomeCategory extends StatelessWidget {
  const FHomeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Obx(() {
      if (categoryController.isLoading.value) return const FCategoryShimmer();

      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'No Data Found', 
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.apply(color: Colors.white),
          ),
        );
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            return FVerticalImageText(
              image: category.image,
              title: category.name,
              onTap: () => Get.to(() => SubCategoriesScreen()),
            );
          },
        ),
      );
    });
  }
}
