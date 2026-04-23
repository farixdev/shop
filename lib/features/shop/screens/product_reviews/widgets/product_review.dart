import 'package:flutter/material.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/utils/constants/sizes.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      ///App Bar
      appBar: FAppBar(title: Text('Reviews & Rating'), showBackArrow: true),

      ///body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(FSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text("Rating and Reviews are verified adn are fro people who use the same type of device that you do"),
               SizedBox(height: FSizes.defaultBtwItems,),

               // Overall Product Rating
               
            ],
          ),
          ),
      ),
    );
  }
}
