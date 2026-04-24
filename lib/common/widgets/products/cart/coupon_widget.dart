

import 'package:flutter/material.dart';
import 'package:shop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class FCouponCode extends StatelessWidget {
  const FCouponCode({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
        final dark = FHelperFunctions.isDarkMode(context);
    return FRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? FColors.dark : FColors.white,
      padding: EdgeInsets.only(
        top: FSizes.sm,
        bottom: FSizes.sm,
        left: FSizes.md,
        right: FSizes.sm,
      ),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Have a promo code? Enter here',
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
              ),
            ),
          ),
          //Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                // ignore: deprecated_member_use
                foregroundColor: dark?  FColors.white.withOpacity(0.5) : FColors.dark.withOpacity(0.5),
                // ignore: deprecated_member_use
                backgroundColor: FColors.grey.withOpacity(0.2), 
                // ignore: deprecated_member_use
                side: BorderSide(color: FColors.grey.withOpacity(0.1)),
    
              ),
              child: Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}
