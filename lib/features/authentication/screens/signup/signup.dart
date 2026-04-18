import 'package:flutter/material.dart';

import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/constants/text_strings.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = FHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsGeometry.all(FSizes.defaultSpace),
          child: Column(
            children: [
              ///Title
              Text(
                FTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: FSizes.defaultBtwSections),

              ///Form
              Form(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            expands: false,
                            decoration: const InputDecoration(
                              label: Text(FTexts.firstName),
                              prefixIcon: Icon(Iconsax.user),
                            ),
                          ),
                        ),
                        const SizedBox(width: FSizes.spaceBtwInputFields),
                        Expanded(
                          child: TextFormField(
                            expands: false,
                            decoration: const InputDecoration(
                              label: Text(FTexts.lastName),
                              prefixIcon: Icon(Iconsax.user),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: FSizes.spaceBtwInputFields),

                    ///Username
                    TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                        label: Text(FTexts.username),
                        prefixIcon: Icon(Iconsax.user_edit),
                      ),
                    ),
                    const SizedBox(height: FSizes.spaceBtwInputFields),

                    ///Email
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(FTexts.email),
                        prefixIcon: Icon(Iconsax.direct),
                      ),
                    ),
                    const SizedBox(height: FSizes.spaceBtwInputFields),

                    ///Phone Number
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(FTexts.phoneNo),
                        prefixIcon: Icon(Iconsax.call),
                      ),
                    ),
                    const SizedBox(height: FSizes.spaceBtwInputFields),

                    ///password
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: FTexts.phoneNo,
                        prefixIcon: Icon(Iconsax.password_check),
                        suffixIcon: Icon(Iconsax.eye_slash),
                      ),
                    ),
                    const SizedBox(height: FSizes.spaceBtwInputFields),

                    ///Terms and conditions checkbox
                    Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(value: true, onChanged: (value) {}),
                        ),
                        const SizedBox(width: FSizes.defaultBtwItems),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '${FTexts.iAgreeTo} ',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              TextSpan(
                                text: '${FTexts.privacyPolicy} ',
                                style: Theme.of(context).textTheme.bodyMedium!
                                    .apply(
                                      color: dark
                                          ? FColors.white
                                          : FColors.primaryColor,
                                      decoration: TextDecoration.underline,
                                      decorationColor: dark
                                          ? FColors.white
                                          : FColors.primaryColor,
                                    ),
                              ),
                              TextSpan(
                                text: '${FTexts.and} ',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              TextSpan(
                                text: FTexts.termOfUse,
                                style: Theme.of(context).textTheme.bodyMedium!
                                    .apply(
                                      color: dark
                                          ? FColors.white
                                          : FColors.primaryColor,
                                      decoration: TextDecoration.underline,
                                      decorationColor: dark
                                          ? FColors.white
                                          : FColors.primaryColor,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    ///signup button
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
