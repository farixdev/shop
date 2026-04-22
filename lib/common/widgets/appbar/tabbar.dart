import 'package:flutter/material.dart';

import 'package:shop/utils/constants/colors.dart';


import 'package:shop/utils/device/device_utility.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class FTabBar extends StatelessWidget implements PreferredSizeWidget {   
  const FTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? FColors.black : FColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: FColors.primaryColor,
        labelColor: dark ? FColors.white : FColors.primaryColor,
        unselectedLabelColor: FColors.darkgrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(FDeviceUtility.getAppBarHeight());
}
