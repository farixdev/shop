import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shop/features/authentication/controllers/forget_password/forget_password_controller.dart';

import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/constants/text_strings.dart';
import 'package:shop/utils/validators/validation.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(FSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Heading
            Text(
              FTexts.forgotPasswordTitle,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: FSizes.defaultBtwItems),
            Text(
              FTexts.forgotPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: FSizes.defaultBtwSections * 2),

            //Text Feilds
            Form(
              key: controller.forgotPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: FValidator.validateEmail,
                decoration: const InputDecoration(
                  labelText: FTexts.email,
                  prefixIcon: const Icon(Iconsax.direct_right),
                ),
              ),
            ),
            const SizedBox(height: FSizes.defaultBtwSections),
            //button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.sendPasswordResetEmail(),
                child: const Text(FTexts.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
