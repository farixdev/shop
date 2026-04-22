import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:shop/common/widgets/list_tiles/setting_menu_tiles.dart';
import 'package:shop/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:shop/common/widgets/texts/section_heading.dart';

import 'package:shop/utils/constants/colors.dart';

import 'package:shop/utils/constants/sizes.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///--- Header
            FPrimaryHeaderContainer(
              child: Column(
                children: [
                  FAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.apply(color: FColors.white),
                    ),
                  ),
                  //const SizedBox(height: FSizes.defaultBtwItems  ,),

                  //User Profile Card
                  FUserProfileTile(),
                  const SizedBox(height: FSizes.defaultBtwSections,)
                ],
              ),
            ),

            ///-- Body
            Padding(
              padding: const EdgeInsets.all(FSizes.defaultSpace),
              child: Column(
                children: [
                  // --Account Setting
                  FSectionHeading(title: 'Account Setting'),
                  const SizedBox(height: FSizes.defaultBtwItems,),
                  SettingMenuTile(icon: Iconsax.safe_home, title: 'My Address', subTitle: 'Set shopping delivery address', onTap:  (){}),

                ],
              ),
              
              )
          ],
        ),
      ),
    );
  }
}

