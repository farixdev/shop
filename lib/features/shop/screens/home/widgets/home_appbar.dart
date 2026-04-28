import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:shop/common/widgets/appbar/appbar.dart';

import 'package:shop/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:shop/features/personalization/controllers/user_controller.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/text_strings.dart';

class FHomeAppBar extends StatelessWidget {
  const FHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return FAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            FTexts.homeAppBarTitle,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: FColors.grey),
          ),
          Text(
            FTexts.homeAppBarSubTitle,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: FColors.white),
          ),
        ],
      ),
      actions: [FCartCounterIcon(onPressed: () {}, iconColor: FColors.white)],
    );
  }
}
