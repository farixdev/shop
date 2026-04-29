import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/features/shop/controllers/admin_controller.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/features/shop/screens/admin/widgets/add_product.dart';

class ManageProductsScreen extends StatelessWidget {
  const ManageProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AdminController.instance;
    return Scaffold(
      appBar: const FAppBar(showBackArrow: true, title: Text('Manage Products')),
      body: Obx(() {
        if (controller.isLoading.value) return const Center(child: CircularProgressIndicator());
        if (controller.allProducts.isEmpty) return const Center(child: Text('No products found.'));

        return ListView.separated(
          padding: const EdgeInsets.all(FSizes.defaultSpace),
          itemCount: controller.allProducts.length,
          separatorBuilder: (_, __) => const SizedBox(height: FSizes.defaultBtwItems),
          itemBuilder: (_, index) {
            final product = controller.allProducts[index];
            return ListTile(
              leading: Image.network(product.thumbnail, width: 50, height: 50, fit: BoxFit.cover),
              title: Text(product.title),
              subtitle: Text('Rs ${product.price}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () => Get.to(() => AddProductScreen(product: product)),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => controller.deleteProduct(product.id),
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
