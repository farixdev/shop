
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shop/utils/constants/colors.dart';

class FRatingBarIndicator extends StatelessWidget {
  const FRatingBarIndicator({
    super.key, required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating ,
      itemSize: 20,
      unratedColor: const Color.fromARGB(255, 190, 190, 190) ,
      itemBuilder: (_, __) =>
          Icon(Iconsax.star_1, color: FColors.fprimaryColor),
    );
  }
}
