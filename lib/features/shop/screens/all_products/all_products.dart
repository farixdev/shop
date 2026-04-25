import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/utils/constants/sizes.dart';

class AllProduct extends StatelessWidget {
  const AllProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FAppBar(title: Text('Popular Products'), showBackArrow: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(FSizes.defaultSpace),
        child: Column(
          children: [
            //Drop Down
            DropdownButtonFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.sort)
              ),
              onChanged: (value) {},
              items: []),
          ],
        ),
      ),
    );
  }
}
