import 'package:flutter/material.dart';

import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/common/widgets/products/rating/rating_indicator.dart';

import 'package:shop/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';

import 'package:shop/utils/constants/sizes.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///App Bar
      appBar: FAppBar(title: Text('Reviews & Rating'), showBackArrow: true),

      ///body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(FSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Rating and Reviews are verified adn are fro people who use the same type of device that you do",
              ),
              SizedBox(height: FSizes.defaultBtwItems),

              // Overall Product Rating
              FOverallProductRating(),
              FRatingBarIndicator(rating: 4.5 ,),
              Text("12,611" , style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: FSizes.defaultBtwSections,),

              //User reviews LIST
            ],
          ),
        ),
      ),
    );
  }
}
