import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop/common/widgets/shimmer/shimmer.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class FCircularImage extends StatelessWidget {
  const FCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = FSizes.sm,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??( dark ? FColors.black : FColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
        child: isNetworkImage 
        ? CachedNetworkImage(
          imageUrl: image,
          fit: fit,
          color:  overlayColor,
          progressIndicatorBuilder: (context , url , downloadProgress) => const FShimmerEffect(width: 55, height: 55 , radius: 55,),
          errorWidget: (context, url , error) => const Icon(Icons.error),
          )
        : Image(
        fit: fit,
        image:  AssetImage(image),
        color: overlayColor,
      ),
      ),
      )
    );
  }
}
