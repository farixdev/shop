import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import 'package:shop/common/widgets/images/circular_image.dart';
import 'package:shop/features/personalization/controllers/user_controller.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/image_strings.dart';

class FUserProfileTile extends StatelessWidget {
  const FUserProfileTile({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: FCircularImage(
        image: FImages.profilePicture,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        controller.user.value!.fullName,
        style: Theme.of(
          context,
        ).textTheme.headlineSmall!.apply(color: FColors.white),
      ),
      subtitle: Text(
        controller.user.value!.email,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.apply(color: FColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: Icon(Iconsax.edit, color: FColors.white),
      ),
    );
  }
}
