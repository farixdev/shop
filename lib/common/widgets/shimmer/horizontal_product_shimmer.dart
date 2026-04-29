import 'package:flutter/material.dart';
import 'package:shop/common/widgets/layouts/grid_layout.dart';
import 'package:shop/common/widgets/shimmer/shimmer.dart';
import 'package:shop/utils/constants/sizes.dart';

class FHorizontalProductShimmer extends StatelessWidget {
  const FHorizontalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: FSizes.defaultBtwSections),
      height: 120,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: FSizes.defaultBtwItems),
        itemBuilder: (context, index) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Image
            FShimmerEffect(width: 120, height: 120),
            SizedBox(width: FSizes.defaultBtwItems),

            /// Text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: FSizes.defaultBtwItems / 2),
                FShimmerEffect(width: 160, height: 15),
                SizedBox(height: FSizes.defaultBtwItems / 2),
                FShimmerEffect(width: 110, height: 15),
                SizedBox(height: FSizes.defaultBtwItems / 2),
                FShimmerEffect(width: 80, height: 15),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
