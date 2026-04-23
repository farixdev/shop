import 'package:flutter/material.dart';
import 'package:shop/utils/constants/colors.dart';

class FChipTheme {
  FChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    // ignore: deprecated_member_use
    disabledColor: FColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: FColors.black),
    selectedColor: FColors.fprimaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: FColors.white,
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: FColors.darkergrey,
    labelStyle: const TextStyle(color: FColors.white),
    selectedColor: FColors.fprimaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: FColors.white,
  );
}
