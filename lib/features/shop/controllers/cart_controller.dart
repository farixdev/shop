import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop/features/shop/models/cart_item_model.dart';
import 'package:shop/features/shop/models/product_model.dart';
import 'package:shop/utils/popups/loaders.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  /// Variables
  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final deviceStorage = GetStorage();

  CartController() {
    loadCartItems();
  }

  // Add items to the cart
  void addToCart(ProductModel product) {
    // Quantity Check
    if (productQuantityInCart.value < 1) {
      FLoaders.warningSnackBar(title: 'Oh Snap!', message: 'Select Quantity');
      return;
    }

    // Convert ProductModel to CartItemModel
    final selectedItem = convertToCartItem(product, productQuantityInCart.value);

    // Check if already added
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == selectedItem.productId);

    if (index >= 0) {
      // Already added, update quantity
      cartItems[index].quantity += selectedItem.quantity;
    } else {
      cartItems.add(selectedItem);
    }

    updateCart();
    FLoaders.sucessSnackBar(title: 'Success', message: 'Product added to the Cart.');
  }

  void addOneToCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == item.productId);

    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }

    updateCart();
  }

  void removeOneFromCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == item.productId);

    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        // Show dialog before removing
        cartItems.removeAt(index);
      }
      updateCart();
    }
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are you sure you want to remove this product?',
      onConfirm: () {
        cartItems.removeAt(index);
        updateCart();
        Get.back();
        FLoaders.sucessSnackBar(title: 'Success', message: 'Product removed from the Cart.');
      },
      onCancel: () => Get.back(),
    );
  }

  // Initialize Product Quantity
  void updateAlreadyAddedProductCount(ProductModel product) {
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == product.id);
    if (index >= 0) {
      productQuantityInCart.value = cartItems[index].quantity;
    } else {
      productQuantityInCart.value = 0;
    }
  }

  // Convert ProductModel to CartItemModel
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    return CartItemModel(
      productId: product.id,
      title: product.title,
      price: product.price,
      image: product.thumbnail,
      brand: product.brand,
      quantity: quantity,
    );
  }

  // Update Cart Totals
  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity;
      calculatedNoOfItems += item.quantity;
    }

    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    deviceStorage.write('cartItems', cartItemStrings);
  }

  void loadCartItems() {
    final cartItemStrings = deviceStorage.read<List<dynamic>>('cartItems');
    if (cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings.map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems.where((item) => item.productId == productId).fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }

  void addProductToCart(ProductModel product) {
    productQuantityInCart.value = 1;
    addToCart(product);
  }
}
