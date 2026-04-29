import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/common/widgets/list_tiles/setting_menu_tiles.dart';
import 'package:shop/features/shop/screens/admin/widgets/add_category.dart';
import 'package:shop/features/shop/screens/admin/widgets/add_product.dart';
import 'package:shop/features/shop/screens/admin/widgets/add_banner.dart';
import 'package:shop/features/shop/screens/admin/widgets/manage_banners.dart';
import 'package:shop/features/shop/screens/admin/widgets/manage_orders.dart';
import 'package:shop/features/shop/screens/admin/widgets/manage_users.dart';

import 'package:shop/features/shop/screens/admin/widgets/manage_categories.dart';
import 'package:shop/features/shop/screens/admin/widgets/manage_products.dart';
import 'package:shop/features/shop/screens/admin/widgets/add_brand.dart';
import 'package:shop/features/shop/screens/admin/widgets/manage_brands.dart';

import 'package:shop/features/shop/controllers/admin_controller.dart';

import 'package:shop/utils/constants/sizes.dart';

class AdminPanelScreen extends StatelessWidget {
  const AdminPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminController());
    return Scaffold(
      appBar: const FAppBar(
        showBackArrow: true,
        title: Text('Admin Panel'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(FSizes.defaultSpace),
          child: Column(
            children: [
              SettingMenuTile(
                icon: Iconsax.category_copy,
                title: 'Add Category',
                subTitle: 'Create a new product category',
                onTap: () => Get.to(() => const AddCategoryScreen()),
              ),
              SettingMenuTile(
                icon: Iconsax.category_copy,
                title: 'Manage Categories',
                subTitle: 'Edit or Delete existing categories',
                onTap: () => Get.to(() => const ManageCategoriesScreen()),
              ),
              const Divider(),
              SettingMenuTile(
                icon: Iconsax.box_copy,
                title: 'Add Product',
                subTitle: 'Upload a new product to the store',
                onTap: () => Get.to(() => const AddProductScreen()),
              ),
              SettingMenuTile(
                icon: Iconsax.box_copy,
                title: 'Manage Products',
                subTitle: 'Edit or Delete existing products',
                onTap: () => Get.to(() => const ManageProductsScreen()),
              ),
              const Divider(),
              SettingMenuTile(
                icon: Iconsax.shop_copy,
                title: 'Add Brand',
                subTitle: 'Create a new brand',
                onTap: () => Get.to(() => const AddBrandScreen()),
              ),
              SettingMenuTile(
                icon: Iconsax.shop_copy,
                title: 'Manage Brands',
                subTitle: 'Edit or Delete existing brands',
                onTap: () => Get.to(() => const ManageBrandsScreen()),
              ),
              const Divider(),
              SettingMenuTile(
                icon: Iconsax.image_copy,
                title: 'Add Banner',
                subTitle: 'Upload a new promotional banner',
                onTap: () => Get.to(() => const AddBannerScreen()),
              ),
              SettingMenuTile(
                icon: Iconsax.image_copy,
                title: 'Manage Banners',
                subTitle: 'Delete existing banners',
                onTap: () => Get.to(() => const ManageBannersScreen()),
              ),
              const Divider(),
              SettingMenuTile(
                icon: Iconsax.status_copy,
                title: 'Manage Orders',
                subTitle: 'View and update order status',
                onTap: () => Get.to(() => const ManageOrdersScreen()),
              ),
              SettingMenuTile(
                icon: Iconsax.user_copy,
                title: 'Manage Users',
                subTitle: 'View all registered customers',
                onTap: () => Get.to(() => const ManageUsersScreen()),
              ),
              const Divider(),
              SettingMenuTile(
                icon: Iconsax.data_copy,
                title: 'Seed Dummy Data',
                subTitle: 'Upload high-quality sample data to your store',
                onTap: () => controller.seedDummyData(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
