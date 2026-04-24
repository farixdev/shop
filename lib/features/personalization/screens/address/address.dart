import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';

import 'package:shop/features/personalization/screens/address/add_new_address.dart';
import 'package:shop/features/personalization/screens/address/widgets/single_address.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/sizes.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddNewAddressScreen()),
        backgroundColor: FColors.fprimaryColor,
        child: Icon(Iconsax.add_copy , color: FColors.white,),
      ),
      appBar: FAppBar(
        showBackArrow: true,
        title: Text('Addresses' , style: Theme.of(context).textTheme.headlineSmall  ,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(FSizes.defaultSpace),
          child: Column(
            children: [
             FSingleAddress(selectedAddress: true)
            ],
          ),

        ),
      ),
    );
  }
}
