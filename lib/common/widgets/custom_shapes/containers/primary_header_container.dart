import 'package:flutter/material.dart';
import 'package:shop/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:shop/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';

import 'package:shop/utils/constants/colors.dart';

class FPrimaryHeaderContainer extends StatelessWidget {
  const FPrimaryHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FCurveEdgeWidget(
      child: Container(
        color: FColors.fprimaryColor,
        padding: const EdgeInsets.all(0),
       
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: FCircularContainer(
                  // ignore: deprecated_member_use
                  backgroundColor: FColors.textWhite.withOpacity(0.1),
                ),
              ),

              Positioned(
                top: 100,
                right: -300,
                child: FCircularContainer(
                  // ignore: deprecated_member_use
                  backgroundColor: FColors.textWhite.withOpacity(0.1),
                ),
              ),
              child,
            ],
          
        ),
      ),
    );
  }
}
