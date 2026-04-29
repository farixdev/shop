import 'package:flutter/material.dart';
import 'package:shop/common/widgets/shimmer/shimmer.dart';
import 'package:shop/utils/constants/sizes.dart';

class FCategoryShimmer extends StatelessWidget {
  const FCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) =>
            const SizedBox(width: FSizes.defaultBtwItems),
        itemCount: itemCount,
        itemBuilder: (_, __) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Image
              FShimmerEffect(width: 55, height: 55 , radius: 55,),
              SizedBox(height: FSizes.defaultBtwItems / 2,),


              ///Text
              FShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
