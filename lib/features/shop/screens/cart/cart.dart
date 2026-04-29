import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/features/shop/controllers/cart_controller.dart';
import 'package:shop/features/shop/screens/checkout/checkout.dart';
import 'package:shop/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());

    return Scaffold(
      appBar: FAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Obx(() {
        if (controller.cartItems.isEmpty) {
          return const Center(child: Text('Whoops! Cart is Empty.'));
        }

        return Padding(
          padding: const EdgeInsets.all(FSizes.defaultSpace),
          child: ListView.separated(
            itemCount: controller.cartItems.length,
            separatorBuilder: (_, __) => const SizedBox(height: FSizes.defaultBtwSections),
            itemBuilder: (_, index) {
              final item = controller.cartItems[index];
              return Row(
                children: [
                  // Image
                  Image.network(item.image ?? '', width: 60, height: 60, fit: BoxFit.cover),
                  const SizedBox(width: FSizes.defaultBtwItems),

                  // Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.title, style: Theme.of(context).textTheme.titleMedium),
                        Text(item.brand ?? '', style: Theme.of(context).textTheme.labelMedium),
                      ],
                    ),
                  ),

                  // Quantity
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: () => controller.removeOneFromCart(item),
                      ),
                      Text('${item.quantity}', style: Theme.of(context).textTheme.titleMedium),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        onPressed: () => controller.addOneToCart(item),
                      ),
                    ],
                  ),

                  // Price
                  Text('\$${(item.price * item.quantity).toStringAsFixed(2)}'),
                ],
              );
            },
          ),
        );
      }),
      bottomNavigationBar: Obx(() {
        if (controller.cartItems.isEmpty) return const SizedBox();
        return Padding(
          padding: const EdgeInsets.all(FSizes.defaultSpace),
          child: ElevatedButton(
            onPressed: () => Get.to(() => const CheckoutScreen()),
            child: Text('Checkout \$${controller.totalCartPrice.value.toStringAsFixed(2)}'),
          ),
        );
      }),
    );
  }
}
