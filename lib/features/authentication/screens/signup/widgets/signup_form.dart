import 'package:flutter/material.dart';
import 'package:get/get.dart';



import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shop/features/authentication/controllers/signup/signup_controller.dart';

import 'package:shop/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';

import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/constants/text_strings.dart';
import 'package:shop/utils/validators/validation.dart';

class FSignupForm extends StatelessWidget {
  const FSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  expands: false,
                  validator: (value) => FValidator.vlidateEmptyText('First Name', value),
                  decoration: const InputDecoration(
                    label: Text(FTexts.firstName),
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: FSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => FValidator.vlidateEmptyText('Last Name', value),
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
            controller: controller.username,
            expands: false,
            validator: (value) => FValidator.vlidateEmptyText('Username', value),
            decoration: const InputDecoration(
              label: Text(FTexts.username),
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: FSizes.spaceBtwInputFields),

          ///Email
          TextFormField(
            validator: (value) => FValidator.validateEmail(value),
            controller: controller.email,
            decoration: const InputDecoration(
              label: Text(FTexts.email),
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: FSizes.spaceBtwInputFields),

          ///Phone Number
          TextFormField(
            validator: (value) => FValidator.validatePhoneNumber(value),
            controller: controller.phoneNumber,
            decoration: const InputDecoration(
              label: Text(FTexts.phoneNo),
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: FSizes.spaceBtwInputFields),

          ///password
          TextFormField(
            controller: controller.password,
            validator: (value) => FValidator.validatePassword(value),
            obscureText: controller.hidePassword.value,
            decoration:  InputDecoration(
              labelText: FTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: IconButton(
                onPressed: () => controller.hidePassword.value = !controller.hidePassword.value, 
                icon: const Icon(Iconsax.eye_slash)
                )
            ),
          ),
          const SizedBox(height: FSizes.spaceBtwInputFields),

          ///Terms and conditions checkbox
          const FTermsAndConditionsCheckBox(),

          const SizedBox(height: FSizes.defaultBtwSections),

          ///signup button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(

              onPressed: () => controller.signup(),
              child: const Text(FTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
