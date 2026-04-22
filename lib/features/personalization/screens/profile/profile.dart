import 'package:flutter/material.dart';

import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/common/widgets/images/circular_image.dart';
import 'package:shop/common/widgets/texts/section_heading.dart';
import 'package:shop/features/personalization/screens/profile/widget/profile_menu.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FAppBar(showBackArrow: true, title: Text('Profile')),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(FSizes.defaultSpace),
          child: Column(
            children: [
              //Profile Image
              SizedBox(
                width: double.infinity ,
                child: Column(
                  children: [
                    FCircularImage(
                      image: FImages.profilePicture,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                      onPressed: () {},
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
              FSectionHeading(title: 'Profile Information' , ),
              const SizedBox(height: FSizes.defaultBtwItems),

              FProfileMenu(onPressed: () {  }, title: 'Name', value: 'Faris Ahmad',),
              FProfileMenu(onPressed: () {  }, title: 'Username', value: 'Farix21',),

              const SizedBox(height: FSizes.defaultBtwItems),
              const Divider(),
              const SizedBox(height: FSizes.defaultBtwItems),

              //Heading Personal INFO



            ],
          ),
        ),
      ),
    );
  }
}

