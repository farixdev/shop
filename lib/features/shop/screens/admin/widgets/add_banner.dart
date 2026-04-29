import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/features/shop/controllers/admin_controller.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/features/shop/models/banner_model.dart';

class AddBannerScreen extends StatelessWidget {
  const AddBannerScreen({super.key, this.banner});

  final BannerModel? banner;

  @override
  Widget build(BuildContext context) {
    final controller = AdminController.instance;
    final targetScreenController = TextEditingController(text: banner?.targetScreen ?? '');
    final isActive = (banner?.active ?? true).obs;
    final isEditing = banner != null;

    return Scaffold(
      appBar: const FAppBar(showBackArrow: true, title: Text('Add Banner')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(FSizes.defaultSpace),
          child: Column(
            children: [
              // Image Picker
              GestureDetector(
                onTap: () => controller.pickImage(),
                child: Obx(() => Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: controller.selectedImagePath.value.isEmpty
                          ? (isEditing
                              ? Image.network(banner!.imageUrl, fit: BoxFit.cover)
                              : const Icon(Icons.add_a_photo, size: 50))
                          : Image.file(File(controller.selectedImagePath.value), fit: BoxFit.cover),
                    )),
              ),
              const SizedBox(height: FSizes.defaultBtwSections),

              TextFormField(
                controller: targetScreenController,
                decoration: const InputDecoration(labelText: 'Target Screen (e.g. /store)'),
              ),
              const SizedBox(height: FSizes.defaultBtwItems),

              Row(
                children: [
                  Obx(() => Checkbox(
                        value: isActive.value,
                        onChanged: (value) => isActive.value = value!,
                      )),
                  const Text('Active Banner'),
                ],
              ),
              const SizedBox(height: FSizes.defaultBtwSections),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (isEditing) {
                      controller.updateBanner(
                        banner!.imageUrl,
                        targetScreenController.text.trim(),
                        isActive.value,
                      );
                    } else {
                      controller.addBanner(
                        targetScreenController.text.trim(),
                        isActive.value,
                      );
                    }
                  },
                  child: Text(isEditing ? 'Update Banner' : 'Add Banner'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
