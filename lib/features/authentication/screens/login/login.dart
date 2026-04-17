import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shop/common/styles/spacing_styles.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/image_strings.dart';

import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/constants/text_strings.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //logo, title and subtitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage(
                      dark ? FImages.lightAppLogo : FImages.darkAppLogo,
                    ),
                    height: 100,
                  ),

                  Text(
                    FTexts.loginTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: FSizes.sm),
                  Text(
                    FTexts.loginSubTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),

              ///form
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: FSizes.defaultBtwSections,
                  ),
                  child: Column(
                    children: [
                      ///email
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.direct_right),
                          labelText: FTexts.email,
                        ),
                      ),
                      const SizedBox(height: FSizes.spaceBtwInputFields),

                      ///password
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.password_check),
                          labelText: FTexts.password,
                          suffixIcon: Icon(Iconsax.eye_slash),
                        ),
                      ),

                      const SizedBox(height: FSizes.spaceBtwInputFields / 2),

                      ///Remember me and forgot password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ///Remember me
                          Row(
                            children: [
                              Checkbox(value: true, onChanged: (value) {}),
                              const Text(FTexts.rememberMe),
                            ],
                          ),

                          ///Forgot password
                          TextButton(
                            onPressed: () {},
                            child: const Text(FTexts.forgotPassword),
                          ),
                        ],
                      ),

                      const SizedBox(height: FSizes.defaultBtwSections),

                      //sign in button
                      SizedBox(
                        width: double.infinity, 
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(FTexts.signIn),
                        ),
                      ),
                      const SizedBox(height: FSizes.defaultBtwItems),

                      //create Account Button
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text(FTexts.createAccount),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              ///Devider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Divider(
                      color: dark ? FColors.darkergrey : FColors.grey,
                      thickness: 0.5,
                      indent: 60,
                      endIndent: 5,
                    ),
                  ),
                  Text(
                    FTexts.orSignInWith.capitalize!,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Flexible(
                    child: Divider(
                      color: dark ? FColors.darkergrey : FColors.grey,
                      thickness: 0.5,
                      indent: 5,
                      endIndent: 60,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: FSizes.defaultBtwSections),

              ///Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: FColors.grey),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                        width: FSizes.iconMd,
                        height: FSizes.iconMd,
                        image: AssetImage(FImages.google),
                      ),
                    ),
                  ),
                  const SizedBox(width: FSizes.defaultBtwItems),

                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: FColors.grey),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                        width: FSizes.iconMd,
                        height: FSizes.iconMd,
                        image: AssetImage(FImages.facebook),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
