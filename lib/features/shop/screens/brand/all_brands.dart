import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/common/widgets/brands/brand_card.dart';
import 'package:shop/common/widgets/layouts/grid_layout.dart';

import 'package:shop/common/widgets/texts/section_heading.dart';
import 'package:shop/features/shop/screens/brand/brand_products.dart';
import 'package:shop/features/shop/controllers/brand_controller.dart';
import 'package:shop/common/widgets/shimmer/brand_shimmer.dart';
import 'package:shop/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FAppBar(title: Text('Brand'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.all(FSizes.defaultSpace),
        child: Column(
          children: [
            //heading
            FSectionHeading(title: 'Brands'),
            SizedBox(height: FSizes.defaultBtwItems,),



            //Brands
            Obx(() {
              final brandController = BrandController.instance;
              if (brandController.isLoading.value) return FBrandShimmer();

              if (brandController.allBrands.isEmpty) {
                return Center(child: Text('No Brands Found!', style: Theme.of(context).textTheme.bodyMedium));
              }

              return FGridLayout(
                itemCount: brandController.allBrands.length,
                mainAxisExtent: 80,
                itemBuilder: (context, index) {
                  final brand = brandController.allBrands[index];
                  return FBrandCard(
                    showBorder: true,
                    brand: brand,
                    onTap: () => Get.to(() => BrandProducts(brand: brand)),
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