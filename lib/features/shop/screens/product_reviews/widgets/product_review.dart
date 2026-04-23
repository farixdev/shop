import 'package:flutter/material.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/device/device_utility.dart';

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
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      '4.8',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Column(
                      children: [
                        FRatingProgressIndicator(text: '5', value:1),
                        FRatingProgressIndicator(text: '4', value: 0.8),
                        FRatingProgressIndicator(text: '3', value: 0.6),
                        FRatingProgressIndicator(text: '2', value: 0.4),
                        FRatingProgressIndicator(text: '1', value: 0.2),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FRatingProgressIndicator extends StatelessWidget {
  const FRatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
        ),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: FDeviceUtility.getScreenWidth(context) * 0.5,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: FColors.grey,
              valueColor: AlwaysStoppedAnimation(FColors.fprimaryColor),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        ),
      ],
    );
  }
}
