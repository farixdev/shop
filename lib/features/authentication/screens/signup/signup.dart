import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';

import 'package:shop/common/widgets/login_signup/form_devider.dart';
import 'package:shop/common/widgets/login_signup/social_buttons.dart';
import 'package:shop/features/authentication/screens/signup/widgets/signup_form.dart';

import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      //will make custom appbar later
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsGeometry.all(FSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Title
              Text(
                FTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: FSizes.defaultBtwSections),

              ///Form
              FSignupForm(),
              const SizedBox(height: FSizes.defaultBtwSections),

              ///Devider
              FFormDevider(dividerText: FTexts.orSignUpWith.capitalize!),
              const SizedBox(height: FSizes.defaultBtwSections),

              /// Social buttons
              const FSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
