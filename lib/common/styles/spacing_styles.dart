import 'package:flutter/material.dart';
import 'package:shop/utils/constants/sizes.dart';
class TSpacingStyle
{
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: FSizes.appBarHeight,
    left: FSizes.defaultSpace,
    bottom: FSizes.defaultSpace,
    right: FSizes.defaultSpace,
  );
}