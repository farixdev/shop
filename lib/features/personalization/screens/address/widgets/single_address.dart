import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class FSingleAddress extends StatelessWidget {
  const FSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);
    return FRoundedContainer(
      padding: const EdgeInsets.all(FSizes.md),
      width: double.infinity,
      showBorder: true,

      backgroundColor: selectedAddress
          // ignore: deprecated_member_use
          ? FColors.fprimaryColor.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
          ? FColors.darkergrey
          : FColors.grey,
      margin: EdgeInsets.only(bottom: FSizes.defaultBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top : 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle : null,
              color: selectedAddress
                  ? dark
                        ? FColors.light
                        : FColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Faris Ahmad',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: FSizes.sm / 2),
              const Text('+92 327 0944766' , maxLines: 1, overflow: TextOverflow.ellipsis,),
              const SizedBox(height: FSizes.sm / 2),
              const Text( 'House#408 Block D Avenue6 NFC Society, Lahore' , softWrap: true,),

            ],  
          )
        ],
      ),
    );
  }
}
