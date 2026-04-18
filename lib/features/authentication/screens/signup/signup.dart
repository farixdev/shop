import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
