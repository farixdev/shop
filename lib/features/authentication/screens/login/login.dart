import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';

import 'package:shop/common/styles/spacing_styles.dart';
import 'package:shop/common/widgets/login_signup/form_devider.dart';
import 'package:shop/common/widgets/login_signup/social_buttons.dart';
import 'package:shop/features/authentication/screens/login/widgets/login_form.dart';
import 'package:shop/features/authentication/screens/login/widgets/login_header.dart';

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
          padding: FSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //logo, title and subtitle
              FLoginHeader(dark: dark),

              ///form
              FLoginForm(dark: dark),

              ///Devider
              FFormDevider(dividerText: FTexts.orSignInWith.capitalize!),
              const SizedBox(height: FSizes.defaultBtwSections),

              ///Footer
              FSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
