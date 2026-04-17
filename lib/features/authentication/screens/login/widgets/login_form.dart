import 'package:flutter/material.dart';

import 'package:iconsax_flutter/iconsax_flutter.dart';


import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/constants/text_strings.dart';




class FLoginForm extends StatelessWidget {
  const FLoginForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Form(
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
                child: Text(
                  FTexts.createAccount,
                  style: TextStyle(
                    color: dark ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

