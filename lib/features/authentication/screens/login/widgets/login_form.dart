import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shop/features/authentication/controllers/login/login_controller.dart';
import 'package:shop/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:shop/features/authentication/screens/signup/signup.dart';


import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/constants/text_strings.dart';
import 'package:shop/utils/validators/validation.dart';

class FLoginForm extends StatelessWidget {
  const FLoginForm({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: FSizes.defaultBtwSections,
        ),
        child: Column(
          children: [
            ///email
            ///
            TextFormField(
              controller: controller.email,
              validator: (value) => FValidator.validateEmail(value),
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: FTexts.email,
              ),
            ),
            const SizedBox(height: FSizes.spaceBtwInputFields),

            ///password
            ///password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => FValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: FTexts.password,
                  prefixIcon: Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(
                      controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye,
                    ),
                  ),
                ),
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
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value,
                      ),
                    ),
                    const Text(FTexts.rememberMe),
                  ],
                ),

                ///Forgot password
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text(FTexts.forgotPassword),
                ),
              ],
            ),

            const SizedBox(height: FSizes.defaultBtwSections),

            //sign in button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: Text(FTexts.signIn),
              ),
            ),
            const SizedBox(height: FSizes.defaultBtwItems),

            //create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: Text(
                  FTexts.createAccount,
                  style: TextStyle(color: dark ? Colors.white : Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
