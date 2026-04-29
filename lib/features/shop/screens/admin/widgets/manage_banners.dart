import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/features/shop/controllers/admin_controller.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/features/shop/screens/admin/widgets/add_banner.dart';

class ManageBannersScreen extends StatelessWidget {
  const ManageBannersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AdminController.instance;
    return Scaffold(
      appBar: const FAppBar(showBackArrow: true, title: Text('Manage Banners')),
      body: Obx(() {
        if (controller.isLoading.value) return const Center(child: CircularProgressIndicator());
        if (controller.allBanners.isEmpty) return const Center(child: Text('No banners found.'));

        return ListView.separated(
          padding: const EdgeInsets.all(FSizes.defaultSpace),
          itemCount: controller.allBanners.length,
          separatorBuilder: (_, __) => const SizedBox(height: FSizes.defaultBtwItems),
          itemBuilder: (_, index) {
            final banner = controller.allBanners[index];
            return ListTile(
              leading: Image.network(banner.imageUrl, width: 80, height: 50, fit: BoxFit.cover),
              title: Text('Screen: ${banner.targetScreen}'),
              subtitle: Text('Status: ${banner.active ? "Active" : "Inactive"}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () => Get.to(() => AddBannerScreen(banner: banner)),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => controller.deleteBanner(banner.imageUrl),
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
