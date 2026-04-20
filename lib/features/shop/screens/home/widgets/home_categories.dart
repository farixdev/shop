import 'package:flutter/material.dart';


import 'package:shop/common/widgets/imag_text/vertical_image_text.dart';


import 'package:shop/utils/constants/image_strings.dart';




class FHomeCategory extends StatelessWidget {
  const FHomeCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return FVerticalImageText(
            image: FImages.womenShoesIcon,
            title: 'Shoes',
            onTap: () {},
          );
        },
      ),
    );
  }
}

