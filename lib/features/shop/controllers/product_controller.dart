import 'package:get/get.dart';
import 'package:shop/data/repositories/products/product_repository.dart';
import 'package:shop/features/shop/models/product_model.dart';
import 'package:shop/features/shop/controllers/category_controller.dart';
import 'package:shop/utils/popups/loaders.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  RxList<ProductModel> allProducts = <ProductModel>[].obs;
  RxString searchQuery = ''.obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    fetchAllProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading.value = true;
      final products = await productRepository.getAllProducts();
      featuredProducts.assignAll(products.take(4).toList());
    } catch (e) {
      FLoaders.erroSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void fetchAllProducts() async {
    try {
      isLoading.value = true;
      final products = await productRepository.getAllProducts();
      allProducts.assignAll(products);
    } catch (e) {
      FLoaders.erroSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Cache for category products futures
  final Map<String, Future<List<ProductModel>>> _categoryProductsFutures = {};

  /// Get products for a specific category
  Future<List<ProductModel>> getCategoryProducts(String categoryId) {
    if (_categoryProductsFutures.containsKey(categoryId)) {
      return _categoryProductsFutures[categoryId]!;
    }
    
    final future = _getCategoryProductsInternal(categoryId);
    _categoryProductsFutures[categoryId] = future;
    return future;
  }

  Future<List<ProductModel>> _getCategoryProductsInternal(String categoryId) async {
    try {
      // Find sub-categories if any
      final categoryController = Get.find<CategoryController>();
      final subCategoryIds = categoryController.allCategories
          .where((c) => c.parentId == categoryId)
          .map((c) => c.id)
          .toList();
          
      final targetCategoryIds = [categoryId, ...subCategoryIds];
      
      // Filter locally from allProducts to save API calls and easily support sub-categories
      return allProducts.where((product) => targetCategoryIds.contains(product.categoryId)).toList();
    } catch (e) {
      FLoaders.erroSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// Search products
  List<ProductModel> searchProducts(String query) {
    return allProducts.where((product) => product.title.toLowerCase().contains(query.toLowerCase())).toList();
  }

  /// Get products for a specific brand
  Future<List<ProductModel>> getBrandProducts(String brandName) async {
    try {
      // Filter locally from allProducts or fetch from repository
      return allProducts.where((product) => product.brand.toLowerCase() == brandName.toLowerCase()).toList();
    } catch (e) {
      FLoaders.erroSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }
}
