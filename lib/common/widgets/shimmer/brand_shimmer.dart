import 'package:flutter/material.dart';
import 'package:shop/common/widgets/layouts/grid_layout.dart';
import 'package:shop/common/widgets/shimmer/shimmer.dart';
import 'package:shop/utils/constants/sizes.dart';

class FBrandShimmer extends StatelessWidget {
  const FBrandShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return FGridLayout(
      mainAxisExtent: 80,
      itemCount: itemCount,
      itemBuilder: (_, __) => const FShimmerEffect(width: 300, height: 80),
    );
  }
}
