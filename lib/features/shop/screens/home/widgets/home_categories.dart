import 'package:flutter/material.dart';

import 'package:shop/common/widgets/image_text/vertical_image_text.dart';



class FHomeCategory extends StatelessWidget {
  const FHomeCategory({super.key, required this.categories});

  final List<Map<String, String>> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return FVerticalImageText(
            image: categories[index]['image']!,
            title: categories[index]['title']!,
            onTap: () {},
          );
        },
      ),
    );
  }
}
