import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';



import 'package:shop/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:shop/utils/constants/sizes.dart';


class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final dark = FHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///1-Product Image Slider
            FProductImageSlider(),

            ///2- Product Details
            Padding(
              padding: EdgeInsets.only(right: FSizes.defaultSpace, left: FSizes.defaultSpace,bottom: FSizes.defaultSpace),
              child: Column(
                children: [
                  ///Rating & Share
                  Row(
                    children: [
                      ///Rating
                      Row(
                        children: [
                          Icon(Iconsax.star, color: Colors.amber, size: 24),
                          SizedBox(width: FSizes.defaultBtwItems /2 ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: '5.0' , style: Theme.of(context).textTheme.bodyLarge,),
                                const TextSpan(text: '(199)')
                              ]
                            )
                          )
                        ],
                      )
                      ///share button
                    ],
                  )
                  ///Price, Title,Stock & Brand
                  ///Attributes
                  ///Checkout Button
                  ///Description
                  ///Reviews
                ],
              ),
            
            )
            
          ],
        ),
      ),
    );
  }
}

