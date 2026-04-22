import 'package:flutter/material.dart';



import 'package:shop/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';


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
            
          ],
        ),
      ),
    );
  }
}

