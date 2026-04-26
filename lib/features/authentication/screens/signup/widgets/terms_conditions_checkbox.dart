import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shop/features/authentication/controllers/signup/signup_controller.dart';

import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/constants/text_strings.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class FTermsAndConditionsCheckBox extends StatelessWidget {
  const FTermsAndConditionsCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = FHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) {
                if (value != null) {
                  controller.privacyPolicy.value = value;
                }
              },
            ),
          ),
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
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? FColors.white : FColors.fprimaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? FColors.white : FColors.fprimaryColor,
                ),
              ),
              TextSpan(
                text: '${FTexts.and} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: FTexts.termOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? FColors.white : FColors.fprimaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? FColors.white : FColors.fprimaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
