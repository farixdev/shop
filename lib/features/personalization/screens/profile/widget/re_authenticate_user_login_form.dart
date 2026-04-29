import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shop/features/personalization/controllers/user_controller.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/constants/text_strings.dart';
import 'package:shop/utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Re-Authenticate User')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(FSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: FValidator.validateEmail,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: FTexts.email,
                  ),
                ),

                const SizedBox(height: FSizes.spaceBtwInputFields),

                //password
                ///password
                Obx(
                  () => TextFormField(
                    controller: controller.verifyPassword,
                    validator: (value) => FValidator.vlidateEmptyText('Password', value),
                    obscureText: controller.hidepassword.value,
                    decoration: InputDecoration(
                      labelText: FTexts.password,
                      prefixIcon: Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                        onPressed: () => controller.hidepassword.value =
                            !controller.hidepassword.value,
                        icon: Icon(
                          controller.hidepassword.value
                              ? Iconsax.eye_slash
                              : Iconsax.eye,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: FSizes.defaultBtwSections),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.reAuthenticateEailandPasswordUser(),
                    child: const Text('Re-Authenticate User'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
