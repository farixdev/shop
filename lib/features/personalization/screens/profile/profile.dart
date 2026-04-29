import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';


import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/common/widgets/images/circular_image.dart';
import 'package:shop/common/widgets/shimmer/shimmer.dart';
import 'package:shop/common/widgets/texts/section_heading.dart';
import 'package:shop/features/personalization/controllers/user_controller.dart';
import 'package:shop/features/personalization/screens/profile/widget/profile_menu.dart';
import 'package:shop/features/personalization/screens/profile/widget/change_name.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: FAppBar(showBackArrow: true, title: Text('Profile')),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(FSizes.defaultSpace),
          child: Column(
            children: [
              //Profile Image
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final NetworkImage =
                          controller.user.value!.profilePicture;
                      final image = NetworkImage.isNotEmpty ? NetworkImage :  FImages.profilePicture;
                      return  controller.imageUploading.value
                      ? FShimmerEffect(width: 80, height: 80 , radius: 80,)
                      : FCircularImage(
                        image: image,
                        width: 80,
                        height: 80,
                        isNetworkImage: NetworkImage.isNotEmpty,
                      );  
                      
                    }),
                    TextButton(
                      onPressed: () => controller.uploadUserProfilePicture(),
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),

              //Details
              const SizedBox(height: FSizes.defaultBtwItems / 2),
              const Divider(),
              const SizedBox(height: FSizes.defaultBtwItems),

              //Heading profile Info
              FSectionHeading(title: 'Profile Information'),
              const SizedBox(height: FSizes.defaultBtwItems),

              FProfileMenu(
                onPressed: () => Get.to(() => const ChangeName()),
                title: 'Name',
                value: controller.user.value!.fullName,
              ),
              FProfileMenu(
                onPressed: () {},
                title: 'Username',
                value: controller.user.value!.username,
              ),

              const SizedBox(height: FSizes.defaultBtwItems),
              const Divider(),
              const SizedBox(height: FSizes.defaultBtwItems),

              //Heading Personal INFO
              FSectionHeading(title: 'Personal Information'),
              const SizedBox(height: FSizes.defaultBtwItems),

              FProfileMenu(
                onPressed: () {},
                title: 'User ID',
                value: controller.user.value!.id,
                icon: Iconsax.copy_copy,
              ),
              FProfileMenu(
                onPressed: () {},
                title: 'E-mail',
                value: controller.user.value!.email,
              ),
              FProfileMenu(
                onPressed: () {},
                title: 'Phone Number',
                value: controller.user.value!.phoneNumber,
              ),
              FProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
              FProfileMenu(
                onPressed: () {},
                title: 'Date of Birth',
                value: '17 Mar 2005',
              ),
              const Divider(),
              const SizedBox(height: FSizes.defaultBtwItems),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
