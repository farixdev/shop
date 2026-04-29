import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/features/shop/controllers/admin_controller.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/validators/validation.dart';
import 'package:shop/features/shop/models/category_model.dart';

class AddCategoryScreen extends StatelessWidget {
  const AddCategoryScreen({super.key, this.category});

  final CategoryModel? category;

  @override
  Widget build(BuildContext context) {
    final controller = AdminController.instance;
    final nameController = TextEditingController(text: category?.name ?? '');
    final isFeatured = (category?.isFeatured ?? true).obs;
    final parentId = (category?.parentId ?? '').obs;
    final isEditing = category != null;

    return Scaffold(
      appBar: const FAppBar(showBackArrow: true, title: Text('Add Category')),
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
                              ? Image.network(category!.image, fit: BoxFit.cover)
                              : const Icon(Icons.add_a_photo))
                          : Image.file(File(controller.selectedImagePath.value), fit: BoxFit.cover),
                    )),
              ),
              const SizedBox(height: FSizes.defaultBtwSections),

              // Form
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Category Name'),
              ),
              const SizedBox(height: FSizes.defaultBtwItems),

              // Parent Category Dropdown
              Obx(() => DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Parent Category (Optional)'),
                    value: parentId.value.isEmpty ? null : parentId.value,
                    items: controller.allCategories
                        .where((cat) => cat.parentId.isEmpty) // Only show root categories as parents
                        .map((cat) => DropdownMenuItem(
                              value: cat.id,
                              child: Text(cat.name),
                            ))
                        .toList(),
                    onChanged: (value) => parentId.value = value ?? '',
                  )),
              const SizedBox(height: FSizes.defaultBtwItems),

              Row(
                children: [
                  Obx(() => Checkbox(
                        value: isFeatured.value,
                        onChanged: (value) => isFeatured.value = value!,
                      )),
                  const Text('Featured Category'),
                ],
              ),
              const SizedBox(height: FSizes.defaultBtwSections),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (isEditing) {
                      controller.updateCategory(
                        category!.id,
                        nameController.text.trim(),
                        isFeatured.value,
                        parentId: parentId.value,
                        oldImageUrl: category!.image,
                      );
                    } else {
                      controller.addCategory(
                        nameController.text.trim(),
                        isFeatured.value,
                        parentId: parentId.value,
                      );
                    }
                  },
                  child: Text(isEditing ? 'Update Category' : 'Add Category'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
