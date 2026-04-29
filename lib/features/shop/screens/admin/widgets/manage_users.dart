import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/features/shop/controllers/admin_controller.dart';
import 'package:shop/utils/constants/sizes.dart';

class ManageUsersScreen extends StatelessWidget {
  const ManageUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AdminController.instance;
    return Scaffold(
      appBar: const FAppBar(showBackArrow: true, title: Text('Manage Users')),
      body: Obx(() {
        if (controller.isLoading.value) return const Center(child: CircularProgressIndicator());
        if (controller.allUsers.isEmpty) return const Center(child: Text('No users found.'));

        return ListView.separated(
          padding: const EdgeInsets.all(FSizes.defaultSpace),
          itemCount: controller.allUsers.length,
          separatorBuilder: (_, __) => const SizedBox(height: FSizes.defaultBtwItems),
          itemBuilder: (_, index) {
            final user = controller.allUsers[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: user.profilePicture.isNotEmpty ? NetworkImage(user.profilePicture) : null,
                child: user.profilePicture.isEmpty ? const Icon(Icons.person) : null,
              ),
              title: Text(user.fullName),
              subtitle: Text(user.email),
              trailing: Text('ID: ${user.id.substring(0, 5)}...'),
            );
          },
        );
      }),
    );
  }
}
