import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/features/shop/controllers/admin_controller.dart';
import 'package:shop/features/shop/screens/admin/widgets/add_brand.dart';
import 'package:shop/utils/constants/sizes.dart';

class ManageBrandsScreen extends StatelessWidget {
  const ManageBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AdminController.instance;
    return Scaffold(
      appBar: const FAppBar(showBackArrow: true, title: Text('Manage Brands')),
      body: Obx(() {
        if (controller.isLoading.value) return const Center(child: CircularProgressIndicator());
        if (controller.allBrands.isEmpty) return const Center(child: Text('No brands found.'));

        return ListView.separated(
          padding: const EdgeInsets.all(FSizes.defaultSpace),
          itemCount: controller.allBrands.length,
          separatorBuilder: (_, __) => const SizedBox(height: FSizes.defaultBtwItems),
          itemBuilder: (_, index) {
            final brand = controller.allBrands[index];
            return ListTile(
              leading: Image.network(brand.image, width: 50, height: 50, fit: BoxFit.cover),
              title: Text(brand.name),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () => Get.to(() => AddBrandScreen(brand: brand)),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => controller.deleteBrand(brand.id),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
