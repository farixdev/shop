import 'package:flutter/material.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/sizes.dart';

class FRoundedContainer extends StatelessWidget {
  const FRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = FSizes.cardRadiusLg,
    this.padding,
    this.child,
    this.backgroundColor = FColors.white,
    this.margin,
    this.borderColor = FColors.borderPrimary,
    this.showBorder = false,
  });

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color backgroundColor;
  final Color borderColor;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height, 
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
