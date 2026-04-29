import 'package:get/get.dart';
import 'package:shop/data/repositories/brands/brand_repository.dart';
import 'package:shop/features/shop/models/brand_model.dart';
import 'package:shop/features/shop/controllers/product_controller.dart';
import 'package:shop/features/shop/controllers/category_controller.dart';
import 'package:shop/utils/popups/loaders.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  RxList<BrandModel> allBrands = <BrandModel>[].obs;
  RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final isLoading = false.obs;
  final brandRepo = Get.put(BrandRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  /// Get featured brands
  Future<void> getFeaturedBrands() async {
    try {
      isLoading.value = true;
      final brands = await brandRepo.getAllBrands();
      allBrands.assignAll(brands);

      // Compute product counts for each brand dynamically
      _updateBrandProductCounts();

      featuredBrands.assignAll(allBrands.where((brand) => brand.isFeatured).take(4).toList());
    } catch (e) {
      FLoaders.erroSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Compute real product counts from the loaded products list
  void _updateBrandProductCounts() {
    try {
      final productController = ProductController.instance;
      for (var brand in allBrands) {
        final count = productController.allProducts
            .where((p) => p.brand.toLowerCase() == brand.name.toLowerCase())
            .length;
        brand.productsCount = count;
      }
    } catch (_) {
      // ProductController may not be ready yet — counts stay at whatever Firestore had
    }
  }

  // Cache for category brands futures
  final Map<String, Future<List<BrandModel>>> _categoryBrandsFutures = {};

  /// Get brands for category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) {
    if (_categoryBrandsFutures.containsKey(categoryId)) {
      return _categoryBrandsFutures[categoryId]!;
    }

    final future = _getBrandsForCategoryInternal(categoryId);
    _categoryBrandsFutures[categoryId] = future;
    return future;
  }

  Future<List<BrandModel>> _getBrandsForCategoryInternal(String categoryId) async {
    try {
      final brands = await brandRepo.getAllBrands();
      
      // Get sub-categories to include all products under this category
      final categoryController = Get.find<CategoryController>();
      final subCategoryIds = categoryController.allCategories
          .where((c) => c.parentId == categoryId)
          .map((c) => c.id)
          .toList();
      final targetCategoryIds = [categoryId, ...subCategoryIds];
      
      // Get products for this category and its sub-categories
      final productController = ProductController.instance;
      final categoryProducts = productController.allProducts
          .where((p) => targetCategoryIds.contains(p.categoryId))
          .toList();
      
      // Get unique brand names from those products
      final brandNamesInCategory = categoryProducts.map((p) => p.brand.toLowerCase()).toSet();
      
      // Filter brands that appear in this category
      return brands.where((brand) => brandNamesInCategory.contains(brand.name.toLowerCase())).toList();
    } catch (e) {
      FLoaders.erroSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }
}


