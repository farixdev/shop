import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/common/widgets/brands/brand_card.dart';
import 'package:shop/common/widgets/layouts/grid_layout.dart';

import 'package:shop/common/widgets/texts/section_heading.dart';
import 'package:shop/features/shop/screens/brand/brand_products.dart';
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
            FGridLayout(
              itemCount: 6,
              mainAxisExtent: 80,
             itemBuilder: (context , index) =>FBrandCard(showBorder: true, onTap: ()=> Get.to(()=>BrandProducts()),)
             
             )
          ],
        ),
        ),
      ),
    );
  }
}