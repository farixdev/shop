import 'package:flutter/material.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/common/widgets/brands/brand_card.dart';
import 'package:shop/common/widgets/products/sortable/sortable_products.dart';
import 'package:shop/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FAppBar(title: Text('Nike'),),
      body: SingleChildScrollView(
        child: Padding(padding:   EdgeInsets.all(FSizes.defaultSpace),
        child: Column(
          children: [
            //Brand Details
            FBrandCard(showBorder: true,),
            SizedBox(height: FSizes.defaultBtwSections),
            FSortableProducts( ),

          ],
        ),
        ),
      ),
    );
  }
}