import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/features/shop/controllers/admin_controller.dart';
import 'package:shop/features/shop/models/brand_model.dart';
import 'package:shop/utils/constants/sizes.dart';

class AddBrandScreen extends StatelessWidget {
  const AddBrandScreen({super.key, this.brand});

  final BrandModel? brand;

  @override
  Widget build(BuildContext context) {
    final controller = AdminController.instance;
    final nameController = TextEditingController(text: brand?.name ?? '');
    final isFeatured = (brand?.isFeatured ?? true).obs;
    final isEditing = brand != null;

    return Scaffold(
      appBar: const FAppBar(showBackArrow: true, title: Text('Add Brand')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(FSizes.defaultSpace),
          child: Column(
            children: [
              // Image Picker
              GestureDetector(
                onTap: () => controller.pickImage(),
                child: Obx(() => Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: controller.selectedImagePath.value.isEmpty
                          ? (isEditing 
                              ? Image.network(brand!.image, fit: BoxFit.cover)
                              : const Icon(Icons.add_a_photo))
                          : Image.file(File(controller.selectedImagePath.value), fit: BoxFit.cover),
                    )),
              ),
              const SizedBox(height: FSizes.defaultBtwSections),

              // Form
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Brand Name'),
              ),
              const SizedBox(height: FSizes.defaultBtwItems),

              Row(
                children: [
                  Obx(() => Checkbox(
                        value: isFeatured.value,
                        onChanged: (value) => isFeatured.value = value!,
                      )),
                  const Text('Featured Brand'),
                ],
              ),
              const SizedBox(height: FSizes.defaultBtwSections),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (isEditing) {
                      controller.updateBrand(
                        brand!.id,
                        nameController.text.trim(),
                        isFeatured.value,
                        oldImageUrl: brand!.image,
                      );
                    } else {
                      controller.addBrand(
                        nameController.text.trim(),
                        isFeatured.value,
                      );
                    }
                  },
                  child: Text(isEditing ? 'Update Brand' : 'Add Brand'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
