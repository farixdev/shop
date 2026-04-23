

import 'package:flutter/material.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/device/device_utility.dart';

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
