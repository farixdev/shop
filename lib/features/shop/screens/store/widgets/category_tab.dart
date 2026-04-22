import 'package:flutter/material.dart';
import 'package:shop/common/widgets/brands/brand_show_case.dart';
import 'package:shop/common/widgets/texts/section_heading.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/constants/sizes.dart';


class FCategoryTab extends StatelessWidget {
  const FCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
                padding: EdgeInsets.all(FSizes.defaultSpace),
                child: Column(
                  children: [
                    ///--Brand
                    FBrandShowcase(
                      images: [
                        FImages.tshirt1,
                        FImages.sneakers1,
                        FImages.watch1,
                      ],
                    ),

                    ///--Products{You Might Like}
                    FSectionHeading(title: 'You Might Like' , showActionButton: true, onPressed: (){}),
                    const SizedBox(height: FSizes.defaultBtwItems,)
                    
                  ],
                ),
              );
  }
}