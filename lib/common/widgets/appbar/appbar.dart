import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shop/utils/constants/colors.dart';

import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/device/device_utility.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class FAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FAppBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPress,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPress;

  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: FSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back,
                icon: Icon(Iconsax.arrow_copy , color: dark? FColors.white : FColors.dark ),
              )
            : leadingIcon != null
            ? IconButton(onPressed: leadingOnPress, icon: Icon(leadingIcon))
            : null,

        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(FDeviceUtility.getAppBarHeight());
}
