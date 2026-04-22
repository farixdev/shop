import 'package:flutter/material.dart';
import 'package:shop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/sizes.dart';
//import 'package:shop/utils/helpers/helper_functions.dart';

class FProductMetaData extends StatelessWidget {
  const FProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    //final dark = FHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Price & Sale Price
        Row(
          children: [
            //Sale Tag
             FRoundedContainer(
                      radius: FSizes.sm,
                      // ignore: deprecated_member_use
                      backgroundColor: FColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: FSizes.sm,
                        vertical: FSizes.xs,
                      ),
                      child:  Text(
                        '20%',
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge!.apply(color: FColors.black),
                      ),
                    ),
            //Price
          ],
        )
        ///Title
        ///Stock Status
        ///Brand
      ],
    );
  }
}
