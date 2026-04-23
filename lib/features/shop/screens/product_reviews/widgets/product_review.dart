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
                  Text('4.8', style: Theme.of(context).textTheme.displayLarge),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '5',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Expanded(
                              child: SizedBox(
                                width:
                                    FDeviceUtility.getScreenWidth(context) *
                                    0.5,
                                child: LinearProgressIndicator(
                                  value: 0.5,
                                  minHeight: 11,
                                  backgroundColor: FColors.grey,
                                  valueColor: AlwaysStoppedAnimation(
                                    FColors.fprimaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              ),
                            ),
                          ],
                        ),
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
