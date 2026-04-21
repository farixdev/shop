import 'package:flutter/material.dart';
import 'package:shop/utils/constants/colors.dart';

class FShadowStyle {
  static final verticalProductShadow = BoxShadow(
    // ignore: deprecated_member_use
    color: FColors.darkgrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

   static final horizontalProductShadow = BoxShadow(
    // ignore: deprecated_member_use
    color: FColors.darkgrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}
