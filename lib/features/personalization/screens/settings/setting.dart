import 'package:flutter/material.dart';

import 'package:iconsax_flutter/iconsax_flutter.dart';

import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:shop/common/widgets/list_tiles/setting_menu_tiles.dart';
import 'package:shop/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:shop/common/widgets/texts/section_heading.dart';

import 'package:shop/utils/constants/colors.dart';

import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);
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
                  const SizedBox(height: FSizes.defaultBtwSections),
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
                  const SizedBox(height: FSizes.defaultBtwItems),

                  SettingMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Address',
                    subTitle: 'Set shopping delivery address',
                    onTap: () {},
                  ),
                  SettingMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subTitle: 'Add, Remove Product and move to checkout',
                    onTap: () {},
                  ),
                  SettingMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Order',
                    subTitle: 'Check your order and order details',
                    onTap: () {},
                  ),
                  SettingMenuTile(
                    icon: Iconsax.bank,
                    title: 'Bank Acoount',
                    subTitle: 'Withdraw balance to registered bank account',
                    onTap: () {},
                  ),
                  SettingMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subTitle: 'List of all the discounted coupons',
                    onTap: () {},
                  ),
                  SettingMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notification',
                    subTitle: 'Set any kind of notification message',
                    onTap: () {},
                  ),
                  SettingMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subTitle: 'Manage data usage and connected accounts',
                    onTap: () {},
                  ),

                  //--App Setings
                  SizedBox(height: FSizes.defaultBtwSections),
                  FSectionHeading(title: 'App Settings'),
                  SettingMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subTitle: 'Upload data to your cloud firebase ',
                  ),

                  SettingMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recomendation based on your location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),

                  SettingMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search resultis safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  SettingMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),

                  //logout button
                  const SizedBox(height: FSizes.defaultBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: dark ? FColors.white : FColors.primaryColor,
                        ),
                      ),
                      child: Text(
                        'Logout',
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: dark ? FColors.white : FColors.dark,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: FSizes.defaultBtwSections * 2.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
