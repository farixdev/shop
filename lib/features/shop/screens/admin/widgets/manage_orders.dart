import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/features/shop/controllers/admin_controller.dart';
import 'package:shop/features/shop/models/order_model.dart';
import 'package:shop/utils/constants/sizes.dart';

class ManageOrdersScreen extends StatelessWidget {
  const ManageOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AdminController.instance;
    return Scaffold(
      appBar: const FAppBar(showBackArrow: true, title: Text('Manage Orders')),
      body: Obx(() {
        if (controller.isLoading.value) return const Center(child: CircularProgressIndicator());
        if (controller.allOrders.isEmpty) return const Center(child: Text('No orders found.'));

        return ListView.separated(
          padding: const EdgeInsets.all(FSizes.defaultSpace),
          itemCount: controller.allOrders.length,
          separatorBuilder: (_, __) => const SizedBox(height: FSizes.defaultBtwItems),
          itemBuilder: (_, index) {
            final order = controller.allOrders[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(FSizes.md),
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Order ID: ${order.id.substring(0, 8)}'),
                      subtitle: Text('Total: \$${order.totalAmount.toStringAsFixed(2)}'),
                      trailing: Text(order.status.name.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Change Status:'),
                        DropdownButton<OrderStatus>(
                          value: order.status,
                          items: OrderStatus.values.map((status) {
                            return DropdownMenuItem(value: status, child: Text(status.name.toUpperCase()));
                          }).toList(),
                          onChanged: (newStatus) {
                            if (newStatus != null) {
                              controller.updateOrderStatus(order.id, newStatus);
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
