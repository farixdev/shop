import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shop/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/constants/text_strings.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Padding(
        padding: EdgeInsets.all(FSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Heading
            Text(FTexts.forgotPasswordTitle, style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: FSizes.defaultBtwItems),
            Text(FTexts.forgotPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: FSizes.defaultBtwSections * 2),

            //Text Feilds
            TextFormField(
              decoration: const InputDecoration(
                labelText: FTexts.email, prefixIcon: const Icon(Iconsax.direct_right ),
              ),
            ),
            const SizedBox(height: FSizes.defaultBtwSections),
            //button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.offAll(() => const ResetPassword()), child: const Text(FTexts.submit))) 

          ],
        ),
        
        
        ),

    );
  }
}