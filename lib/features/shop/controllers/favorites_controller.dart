import 'package:get/get.dart';
import 'package:shop/data/repositories/products/product_repository.dart';
import 'package:shop/features/shop/models/product_model.dart';
import 'package:shop/utils/popups/loaders.dart';
import 'dart:convert';
import 'package:get_storage/get_storage.dart';

class FavoritesController extends GetxController {
  static FavoritesController get instance => Get.find();

  /// Variables
  final favorites = <String, bool>{}.obs;
  final deviceStorage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

  // Method to initialize favorites by reading from storage
  void initFavorites() {
    final json = deviceStorage.read('favorites');
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavoriteProduct(String productId) {
    if (!favorites.containsKey(productId)) {
      favorites[productId] = true;
      saveFavoritesToStorage();
      FLoaders.sucessSnackBar(title: 'Wishlist Updated', message: 'Product added to the Wishlist.');
    } else {
      favorites.remove(productId);
      saveFavoritesToStorage();
      favorites.refresh();
      FLoaders.sucessSnackBar(title: 'Wishlist Updated', message: 'Product removed from the Wishlist.');
    }
  }

  void saveFavoritesToStorage() {
    final encodedFavorites = jsonEncode(favorites);
    deviceStorage.write('favorites', encodedFavorites);
  }

  Future<List<ProductModel>> favoriteProducts() async {
    return await ProductRepository.instance.getFavouriteProducts(favorites.keys.toList());
  }
}
