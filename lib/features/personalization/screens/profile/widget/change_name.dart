import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/features/personalization/controllers/update_name_controller.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/constants/text_strings.dart';
import 'package:shop/utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: FAppBar(
        showBackArrow: true,
        title: Text('Change Name' , style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: Padding(
        padding: EdgeInsets.all(FSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Heading
            Text(
              'User Real name for Verification. This name will be visible on several pages',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: FSizes.defaultBtwSections ,),
            
            //text field and buttons
            Form(
              key: controller.updateUserNameFormKey,
              child: 
              Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) => FValidator.vlidateEmptyText('First Name', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: FTexts.firstName  , prefixIcon: Icon(Iconsax.user) ),
                  ),
                  SizedBox(height: FSizes.spaceBtwInputFields,),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) => FValidator.vlidateEmptyText('Last Name', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: FTexts.lastName  , prefixIcon: Icon(Iconsax.user) ),
                  ),

                ],
              )
            
            ),
            const SizedBox(height: FSizes.defaultBtwSections,),

            //save button
          
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: () => controller.updateUserName() , child : const Text('Save') ),
          )
          ],
        ),
        
        ),
    );
  }
}