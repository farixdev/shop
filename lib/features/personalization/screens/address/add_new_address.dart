import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/utils/constants/sizes.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FAppBar(showBackArrow: true, title: Text('Add New Address')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(FSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
              TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.user_copy), labelText: 'Name')),
              const SizedBox(height: FSizes.spaceBtwInputFields,),
               TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.mobile_copy), labelText: 'Phone Number')),
              const SizedBox(height: FSizes.spaceBtwInputFields,),
              Row(
                children: [
                  Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.building_3_copy), labelText: 'Street')),),
                  const SizedBox(width: FSizes.spaceBtwInputFields,),
                  Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.code_copy), labelText: 'Postal Code')),)
                ],
              ),
              
              const SizedBox(height: FSizes.spaceBtwInputFields,),

              Row(
                children: [
                  Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.building_4_copy), labelText: 'City')),),
                  const SizedBox(width: FSizes.spaceBtwInputFields,),
                  Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.activity_copy), labelText: 'Province')),)
                ],
              ),
              const SizedBox(height: FSizes.spaceBtwInputFields,),
              TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.global_copy), labelText: 'Country')),
              const SizedBox(height: FSizes.defaultSpace,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){}, child: Text('Save')),
              )
            ],
          )),
        ),
      ),
    );
  }
}
