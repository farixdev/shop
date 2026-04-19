import 'package:iconsax_flutter/iconsax_flutter.dart';

import 'package:flutter/material.dart';

import 'package:shop/utils/constants/colors.dart';




class FCartCounterIcon extends StatelessWidget {
  const FCartCounterIcon({super.key, required this.onPressed, required this.iconColor});

  final VoidCallback onPressed;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed:onPressed,
          icon: Icon(Iconsax.shopping_bag, color: iconColor ),
        ),
        Positioned(
          right: 0,

          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: FColors.black,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context).textTheme.labelLarge!.apply(
                  color: FColors.white,
                  fontSizeFactor: 0.8,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}