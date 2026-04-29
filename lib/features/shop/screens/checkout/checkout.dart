import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/features/shop/controllers/cart_controller.dart';
import 'package:shop/data/repositories/orders/order_repository.dart';
import 'package:shop/features/shop/models/order_model.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/popups/full_screen_loader.dart';
import 'package:shop/utils/popups/loaders.dart';
import 'package:shop/data/repositories/authentication/authentication_repository.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final orderRepo = Get.put(OrderRepository());

    return Scaffold(
      appBar: FAppBar(
        showBackArrow: true,
        title: Text('Order Review', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(FSizes.defaultSpace),
          child: Column(
            children: [
              // Items List Summary
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cartController.cartItems.length,
                separatorBuilder: (_, __) => const SizedBox(height: FSizes.defaultBtwItems),
                itemBuilder: (_, index) {
                  final item = cartController.cartItems[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${item.quantity} x ${item.title}'),
                      Text('\$${(item.price * item.quantity).toStringAsFixed(2)}'),
                    ],
                  );
                },
              ),
              const Divider(),
              const SizedBox(height: FSizes.defaultBtwSections),

              // Address & Payment (Placeholders for now)
              const ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Delivery Address'),
                subtitle: Text('123 Main St, New York, NY 10001'),
              ),
              const ListTile(
                leading: Icon(Icons.payment),
                title: Text('Payment Method'),
                subtitle: Text('Cash on Delivery'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(FSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () async {
            try {
              FFullScreenLoader.openLoadingDialog('Processing Order...', 'assets/images/animations/trail_loading.json');

              final userId = AuthenticationRepository.instance.authUser?.uid ?? '';
              
              final order = OrderModel(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                userId: userId,
                status: OrderStatus.pending,
                items: cartController.cartItems.toList(),
                totalAmount: cartController.totalCartPrice.value,
                orderDate: DateTime.now(),
                address: AddressModel(
                  id: '1',
                  name: 'User Name',
                  phoneNumber: '1234567890',
                  street: '123 Main St',
                  city: 'New York',
                  state: 'NY',
                  postalCode: '10001',
                  country: 'USA',
                ),
              );

              await orderRepo.saveOrder(order, userId);
              
              cartController.clearCart();
              FFullScreenLoader.stopLoading();
              FLoaders.sucessSnackBar(title: 'Success', message: 'Order placed successfully!');
              Get.offAllNamed('/home'); // Go to home or orders screen
            } catch (e) {
              FFullScreenLoader.stopLoading();
              FLoaders.erroSnackBar(title: 'Error', message: e.toString());
            }
          },
          child: Text('Confirm Order \$${cartController.totalCartPrice.value.toStringAsFixed(2)}'),
        ),
      ),
    );
  }
}
