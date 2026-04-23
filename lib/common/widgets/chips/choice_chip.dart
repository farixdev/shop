import 'package:flutter/material.dart';
import 'package:shop/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class FChoiceChip extends StatelessWidget {
  const FChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;
  @override
  Widget build(BuildContext context) {
    final isColor = FHelperFunctions.getColor(text) != null;
    return ChoiceChip(
      label: isColor ? SizedBox() : Text(text),
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected ? FColors.white : null),
      avatar: isColor
          ? FCircularContainer(
              width: 50,
              height: 50,
              backgroundColor: FHelperFunctions.getColor(text)!,
            )
          : null,
      shape: isColor
          ? const CircleBorder()
          : null,
      labelPadding: isColor 
          ? EdgeInsets.all(0)
          : null,
      padding: isColor? EdgeInsets.all(0) : null,
      //selectedColor: Colors.green,
      // ignore: prefer_null_aware_operators
      backgroundColor: isColor
          ? FHelperFunctions.getColor(text)!
          : null,
    );
  }
}
