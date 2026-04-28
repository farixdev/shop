import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shop/features/authentication/controllers/login/login_controller.dart';

import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/image_strings.dart';

import 'package:shop/utils/constants/sizes.dart';

class FSocialButton extends StatelessWidget {
  const FSocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: FColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: ()=> controller.googleSignIn(),
            icon: const Image(
              width: FSizes.iconMd,
              height: FSizes.iconMd,
              image: AssetImage(FImages.google),
            ),
          ),
        ),
        const SizedBox(width: FSizes.defaultBtwItems),

        Container(
          decoration: BoxDecoration(
            border: Border.all(color: FColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: FSizes.iconMd,
              height: FSizes.iconMd,
              image: AssetImage(FImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}
