import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class FOrderListItems extends StatelessWidget {
  const FOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, index) => SizedBox(height: FSizes.defaultBtwItems,), 
      itemCount: 4,
      itemBuilder: (_, index) => FRoundedContainer(
      showBorder: true,
      padding: EdgeInsets.all(FSizes.md),
      backgroundColor: dark ? FColors.dark : FColors.light,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Row 1
          Row(
            children: [
              //1-Icon
              Icon(Iconsax.ship_copy),
              SizedBox(width: FSizes.defaultBtwItems / 2),

              //2- Status and Date
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Processing',
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                        color: FColors.fprimaryColor,
                        fontSizeDelta: 1,
                      ),
                    ),
                    Text(
                      '7 Nov 2026',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
              //3- Icon
              IconButton(
                onPressed: () {},
                icon: Icon(Iconsax.arrow_right_copy, size: FSizes.iconSm),
              ),
            ],
          ),
          const SizedBox(height: FSizes.defaultBtwItems),

          //Row 2
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    //1-Icon
                    Icon(Iconsax.tag),
                    SizedBox(width: FSizes.defaultBtwItems / 2),

                    //2- Status and Date
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Text(
                            '[#123456 ]',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Row(
                  children: [
                    //1-Icon
                    Icon(Iconsax.calendar),
                    SizedBox(width: FSizes.defaultBtwItems / 2),

                    //2- Status and Date
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shipping Date',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Text(
                            '3 feb 2026',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      )
    );
  }
}
