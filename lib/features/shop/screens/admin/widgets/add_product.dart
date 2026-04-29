import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/features/shop/controllers/admin_controller.dart';
import 'package:shop/utils/constants/sizes.dart';

import 'package:shop/features/shop/models/product_attribute_model.dart';
import 'package:shop/features/shop/models/product_variation_model.dart';
import 'package:shop/features/shop/models/product_model.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key, this.product});

  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminController());
    final titleController = TextEditingController(text: product?.title ?? '');
    final brandController = TextEditingController(text: product?.brand ?? '');
    final priceController = TextEditingController(text: product?.price.toString() ?? '');
    final descController = TextEditingController(text: product?.description ?? '');
    final categoryId = (product?.categoryId ?? '').obs;
    final productType = (product?.productType ?? 'single').obs;
    final attributes = (product?.productAttributes ?? <ProductAttributeModel>[]).obs;
    final isEditing = product != null;

    return Scaffold(
      appBar: const FAppBar(showBackArrow: true, title: Text('Add Product')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(FSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Picker
              Center(
                child: GestureDetector(
                  onTap: () => controller.pickImage(),
                  child: Obx(() => Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: controller.selectedImagePath.value.isEmpty
                            ? (isEditing
                                ? Image.network(product!.thumbnail, fit: BoxFit.cover)
                                : const Icon(Icons.add_a_photo, size: 50))
                            : Image.file(File(controller.selectedImagePath.value), fit: BoxFit.cover),
                      )),
                ),
              ),
              const SizedBox(height: FSizes.defaultBtwSections),

              // Form
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Product Title'),
              ),
              const SizedBox(height: FSizes.defaultBtwItems),

              TextFormField(
                controller: brandController,
                decoration: const InputDecoration(labelText: 'Brand'),
              ),
              const SizedBox(height: FSizes.defaultBtwItems),

              TextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Price'),
              ),
              const SizedBox(height: FSizes.defaultBtwItems),

              Obx(() => DropdownButtonFormField<String>(
                    value: productType.value,
                    decoration: const InputDecoration(labelText: 'Product Type'),
                    items: ['single', 'variable'].map((type) => DropdownMenuItem(value: type, child: Text(type.capitalizeFirst!))).toList(),
                    onChanged: (value) => productType.value = value ?? 'single',
                  )),
              const SizedBox(height: FSizes.defaultBtwItems),

              Obx(() => DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Category'),
                    items: controller.allCategories
                        .map((category) => DropdownMenuItem(
                              value: category.id,
                              child: Text(category.name),
                            ))
                        .toList(),
                    onChanged: (value) => categoryId.value = value ?? '',
                  )),
              const SizedBox(height: FSizes.defaultBtwItems),

              TextFormField(
                controller: descController,
                maxLines: 3,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              const SizedBox(height: FSizes.defaultBtwSections),

              // Attributes Section
              Obx(() {
                if (productType.value == 'variable') {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Attributes', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextButton(
                            onPressed: () {
                              attributes.add(ProductAttributeModel(name: '', values: []));
                            },
                            child: const Text('Add Attribute'),
                          ),
                        ],
                      ),
                      ...attributes.asMap().entries.map((entry) {
                        int idx = entry.key;
                        var attr = entry.value;
                        return Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(hintText: 'e.g. Color'),
                                onChanged: (val) => attributes[idx].name = val,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(hintText: 'e.g. Red,Blue'),
                                onChanged: (val) {
                                  attributes[idx].values = val.split(',').map((e) => e.trim()).toList();
                                },
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                      const SizedBox(height: FSizes.defaultBtwSections),
                    ],
                  );
                }
                return const SizedBox();
              }),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (isEditing) {
                      controller.updateProduct(
                        id: product!.id,
                        title: titleController.text.trim(),
                        brand: brandController.text.trim(),
                        price: double.tryParse(priceController.text.trim()) ?? 0.0,
                        categoryId: categoryId.value,
                        description: descController.text.trim(),
                        productType: productType.value,
                        productAttributes: attributes,
                        oldThumbnailUrl: product!.thumbnail,
                        productVariations: product!.productVariations, // For now keeping existing variations
                      );
                    } else {
                      controller.addProduct(
                        title: titleController.text.trim(),
                        brand: brandController.text.trim(),
                        price: double.tryParse(priceController.text.trim()) ?? 0.0,
                        categoryId: categoryId.value,
                        description: descController.text.trim(),
                        productType: productType.value,
                        productAttributes: attributes,
                      );
                    }
                  },
                  child: Text(isEditing ? 'Update Product' : 'Add Product'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
