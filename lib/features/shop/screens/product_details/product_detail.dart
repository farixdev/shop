import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:readmore/readmore.dart';
import 'package:shop/common/widgets/texts/section_heading.dart';
import 'package:shop/features/shop/screens/product_details/widgets/product_add_to_cart_widget.dart';
import 'package:shop/features/shop/screens/product_details/widgets/product_attributes.dart';



import 'package:shop/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:shop/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:shop/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:shop/features/shop/screens/product_reviews/widgets/product_review.dart';
import 'package:shop/utils/constants/sizes.dart';


class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final dark = FHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: FBottomAddToCart(),
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
                  ) ,
                   const SizedBox(height: FSizes.defaultBtwSections,),
                  ///Description
                  const FSectionHeading(title: 'Description'),
                  const SizedBox(height: FSizes.defaultBtwItems,),
                  ReadMoreText(
                    'This is product Description fot this specific product, There can be more things that can be added in this as per your need',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  ///Reviews
                  const Divider(),
                  const SizedBox(height: FSizes.defaultBtwItems,),
                  FSectionHeading(title: 'Reviews(199)' ,showActionButton: true, onPressed: () => Get.to( ()=>   ProductReviewScreen()),),
                  const SizedBox(height: FSizes.defaultBtwSections,),
                ],
              ),
            
            )
            
          ],
        ),
      ),
    );
  }
}

