import 'package:flutter/material.dart';
import 'package:shop/features/shop/screens/product_details/widgets/product_attributes.dart';



import 'package:shop/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:shop/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:shop/features/shop/screens/product_details/widgets/rating_share_widget.dart';
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
                  FRatingAndShare(), 
                  ///Price, Title,Stock & Brand
                  FProductMetaData(),
                  ///Attributes
                  ProductAttributes(),
                  const SizedBox(height: FSizes.defaultBtwSections,),
                  ///Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){}, child: Text('Checkout')),
                  ) 
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

