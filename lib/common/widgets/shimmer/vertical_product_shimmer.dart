import 'package:flutter/material.dart';
import 'package:shop/common/widgets/layouts/grid_layout.dart';
import 'package:shop/common/widgets/shimmer/shimmer.dart';
import 'package:shop/utils/constants/sizes.dart';

class FVerticalProductShimmer extends StatelessWidget {
  const FVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return FGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image
            FShimmerEffect(width: 180, height: 180),
            SizedBox(height: FSizes.defaultBtwItems),

            /// Text
            FShimmerEffect(width: 160, height: 15),
            SizedBox(height: FSizes.defaultBtwItems / 2),
            FShimmerEffect(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}
