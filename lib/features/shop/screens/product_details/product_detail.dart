import 'package:flutter/material.dart';

import 'package:shop/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///1-Product Image Slider
            FCurveEdgeWidget(
              child: Container(
                color: dark ? FColors.darkergrey : FColors.light,
                child: Stack(
                  children: [
                    //Main Large Image
                    SizedBox(
                      height: 400,
                      child: Padding(
                        padding: EdgeInsets.all(FSizes.productImageRadius *2),
                        child: Center(
                          child: Image(image: AssetImage(FImages.watch1)),
                        ),
                      ),
                    ),

                    ///Image Slider
                    
                  ],
                ),
              ),
            ),

            ///2- Product Details
          ],
        ),
      ),
    );
  }
}
