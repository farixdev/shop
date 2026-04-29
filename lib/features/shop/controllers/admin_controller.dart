import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop/data/repositories/categories/category_repository.dart';
import 'package:shop/data/repositories/products/product_repository.dart';
import 'package:shop/features/shop/models/category_model.dart';
import 'package:shop/features/shop/models/product_model.dart';
import 'package:shop/utils/popups/full_screen_loader.dart';
import 'package:shop/utils/popups/loaders.dart';
import 'package:shop/data/repositories/banners/banner_repository.dart';
import 'package:shop/features/shop/models/banner_model.dart';
import 'package:shop/utils/constants/dummy_data.dart';
import 'package:shop/features/shop/models/product_attribute_model.dart';
import 'package:shop/features/shop/models/product_variation_model.dart';
import 'package:shop/data/repositories/brands/brand_repository.dart';
import 'package:shop/features/shop/models/brand_model.dart';

import 'package:shop/data/repositories/orders/order_repository.dart';
import 'package:shop/features/shop/models/order_model.dart';
import 'package:shop/features/personalization/models/user_model.dart';
import 'package:shop/data/repositories/user/user_repositry.dart';

import 'package:shop/data/repositories/brands/brand_repository.dart';
import 'package:shop/features/shop/models/brand_model.dart';

class AdminController extends GetxController {
  static AdminController get instance => Get.find();

  final categoryRepository = Get.put(CategoryRepository());
  final productRepository = Get.put(ProductRepository());
  final bannerRepository = Get.put(BannerRepository());
  final orderRepository = Get.put(OrderRepository());
  final userRepository = Get.put(UserRepositry());
  final brandRepository = Get.put(BrandRepository());

  final imageUploading = false.obs;
  RxString selectedImagePath = ''.obs;

  final RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  final RxList<ProductModel> allProducts = <ProductModel>[].obs;
  final RxList<BannerModel> allBanners = <BannerModel>[].obs;
  final RxList<OrderModel> allOrders = <OrderModel>[].obs;
  final RxList<UserModel> allUsers = <UserModel>[].obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      isLoading.value = true;
      final categories = await categoryRepository.getAllCategories();
      final products = await productRepository.getAllProducts();
      final banners = await bannerRepository.fetchBanners();
      final orders = await orderRepository.fetchAllOrders();
      final users = await userRepository.fetchAllUsers();
      final brands = await brandRepository.getAllBrands();
      allCategories.assignAll(categories);
      allProducts.assignAll(products);
      allBanners.assignAll(banners);
      allOrders.assignAll(orders);
      allUsers.assignAll(users);
      allBrands.assignAll(brands);
    } catch (e) {
      FLoaders.erroSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Update Order Status
  Future<void> updateOrderStatus(String orderId, OrderStatus status) async {
    try {
      FFullScreenLoader.openLoadingDialog('Updating Status...', 'assets/images/animations/trail_loading.json');
      await orderRepository.updateOrderStatus(orderId, status);
      int index = allOrders.indexWhere((order) => order.id == orderId);
      if (index >= 0) {
        // Since OrderModel is immutable, we create a new one or just refetch
        fetchData(); 
      }
      FFullScreenLoader.stopLoading();
      FLoaders.sucessSnackBar(title: 'Updated', message: 'Order status updated');
    } catch (e) {
      FFullScreenLoader.stopLoading();
      FLoaders.erroSnackBar(title: 'Error', message: e.toString());
    }
  }

  /// Delete Category
  Future<void> deleteCategory(String id) async {
    try {
      FFullScreenLoader.openLoadingDialog('Deleting Category...', 'assets/images/animations/trail_loading.json');
      await categoryRepository.deleteCategory(id);
      allCategories.removeWhere((item) => item.id == id);
      FFullScreenLoader.stopLoading();
      FLoaders.sucessSnackBar(title: 'Deleted', message: 'Category removed successfully');
    } catch (e) {
      FFullScreenLoader.stopLoading();
      FLoaders.erroSnackBar(title: 'Error', message: e.toString());
    }
  }

  /// Delete Product
  Future<void> deleteProduct(String id) async {
    try {
      FFullScreenLoader.openLoadingDialog('Deleting Product...', 'assets/images/animations/trail_loading.json');
      await productRepository.deleteProduct(id);
      allProducts.removeWhere((item) => item.id == id);
      FFullScreenLoader.stopLoading();
      FLoaders.sucessSnackBar(title: 'Deleted', message: 'Product removed successfully');
    } catch (e) {
      FFullScreenLoader.stopLoading();
      FLoaders.erroSnackBar(title: 'Error', message: e.toString());
    }
  }

  /// Delete Banner
  Future<void> deleteBanner(String imageUrl) async {
    try {
      FFullScreenLoader.openLoadingDialog('Deleting Banner...', 'assets/images/animations/trail_loading.json');
      await bannerRepository.deleteBanner(imageUrl);
      allBanners.removeWhere((item) => item.imageUrl == imageUrl);
      FFullScreenLoader.stopLoading();
      FLoaders.sucessSnackBar(title: 'Deleted', message: 'Banner removed successfully');
    } catch (e) {
      FFullScreenLoader.stopLoading();
      FLoaders.erroSnackBar(title: 'Error', message: e.toString());
    }
  }

  /// Delete Brand
  Future<void> deleteBrand(String id) async {
    try {
      FFullScreenLoader.openLoadingDialog('Deleting Brand...', 'assets/images/animations/trail_loading.json');
      await brandRepository.deleteBrand(id);
      allBrands.removeWhere((item) => item.id == id);
      FFullScreenLoader.stopLoading();
      FLoaders.sucessSnackBar(title: 'Deleted', message: 'Brand removed successfully');
    } catch (e) {
      FFullScreenLoader.stopLoading();
      FLoaders.erroSnackBar(title: 'Error', message: e.toString());
    }
  }

  /// Add Brand
  Future<void> addBrand(String name, bool isFeatured) async {
    try {
      if (selectedImagePath.value.isEmpty) throw 'Please select an image';

      FFullScreenLoader.openLoadingDialog('Uploading Brand...', 'assets/images/animations/trail_loading.json');

      // Upload Image (Reuse category upload image logic or similar)
      final url = await categoryRepository.uploadImage('Brands', XFile(selectedImagePath.value));

      // Create Model
      final brand = BrandModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        image: url,
        isFeatured: isFeatured,
      );

      // Save to Firestore
      await brandRepository.saveBrandRecord(brand);

      // Update local list
      allBrands.add(brand);

      selectedImagePath.value = ''; // Reset image
      FFullScreenLoader.stopLoading();
      FLoaders.sucessSnackBar(title: 'Success', message: 'Brand added successfully');
      Get.back();
    } catch (e) {
      FFullScreenLoader.stopLoading();
      FLoaders.erroSnackBar(title: 'Error', message: e.toString());
    }
  }

  /// Update Brand
  Future<void> updateBrand(String id, String name, bool isFeatured, {required String oldImageUrl}) async {
    try {
      FFullScreenLoader.openLoadingDialog('Updating Brand...', 'assets/images/animations/trail_loading.json');

      String url = oldImageUrl;
      if (selectedImagePath.value.isNotEmpty) {
        url = await categoryRepository.uploadImage('Brands', XFile(selectedImagePath.value));
      }

      final brand = BrandModel(
        id: id,
        name: name,
        image: url,
        isFeatured: isFeatured,
      );

      await brandRepository.saveBrandRecord(brand);
      
      int index = allBrands.indexWhere((item) => item.id == id);
      if (index >= 0) allBrands[index] = brand;

      selectedImagePath.value = '';
      FFullScreenLoader.stopLoading();
      FLoaders.sucessSnackBar(title: 'Success', message: 'Brand updated successfully');
      Get.back();
    } catch (e) {
      FFullScreenLoader.stopLoading();
      FLoaders.erroSnackBar(title: 'Error', message: e.toString());
    }
  }

  /// Pick Image
  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImagePath.value = image.path;
    }
  }

  /// Add Category
  Future<void> addCategory(String name, bool isFeatured, {String parentId = ''}) async {
    try {
      if (selectedImagePath.value.isEmpty) throw 'Please select an image';

      FFullScreenLoader.openLoadingDialog('Uploading Category...', 'assets/images/animations/trail_loading.json');

      // Upload Image
      final url = await categoryRepository.uploadImage('Categories', XFile(selectedImagePath.value));

      // Create Model
      final category = CategoryModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        image: url,
        isFeatured: isFeatured,
        parentId: parentId,
      );

      // Save to Firestore
      await categoryRepository.saveCategoryRecord(category);

      // Update local list
      allCategories.add(category);

      selectedImagePath.value = ''; // Reset image
      FFullScreenLoader.stopLoading();
      FLoaders.sucessSnackBar(title: 'Success', message: 'Category added successfully');
      Get.back();
    } catch (e) {
      FFullScreenLoader.stopLoading();
      FLoaders.erroSnackBar(title: 'Error', message: e.toString());
    }
  }

  /// Update Category
  Future<void> updateCategory(String id, String name, bool isFeatured, {String parentId = '', required String oldImageUrl}) async {
    try {
      FFullScreenLoader.openLoadingDialog('Updating Category...', 'assets/images/animations/trail_loading.json');

      String url = oldImageUrl;
      if (selectedImagePath.value.isNotEmpty) {
        url = await categoryRepository.uploadImage('Categories', XFile(selectedImagePath.value));
      }

      final category = CategoryModel(
        id: id,
        name: name,
        image: url,
        isFeatured: isFeatured,
        parentId: parentId,
      );

      await categoryRepository.saveCategoryRecord(category);
      
      int index = allCategories.indexWhere((item) => item.id == id);
      if (index >= 0) allCategories[index] = category;

      selectedImagePath.value = '';
      FFullScreenLoader.stopLoading();
      FLoaders.sucessSnackBar(title: 'Success', message: 'Category updated successfully');
      Get.back();
    } catch (e) {
      FFullScreenLoader.stopLoading();
      FLoaders.erroSnackBar(title: 'Error', message: e.toString());
    }
  }

  /// Add Product
  Future<void> addProduct({
    required String title,
    required String brand,
    required double price,
    required String categoryId,
    required String description,
    String productType = 'single',
    List<ProductAttributeModel>? productAttributes,
    List<ProductVariationModel>? productVariations,
  }) async {
    try {
      if (selectedImagePath.value.isEmpty) throw 'Please select an image';

      FFullScreenLoader.openLoadingDialog('Uploading Product...', 'assets/images/animations/trail_loading.json');

      // Upload Image
      final url = await productRepository.uploadProductImage(XFile(selectedImagePath.value));

      // Create Model
      final product = ProductModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: title,
        brand: brand,
        price: price,
        thumbnail: url,
        categoryId: categoryId,
        description: description,
        productType: productType,
        productAttributes: productAttributes,
        productVariations: productVariations,
      );

      // Save to Firestore
      await productRepository.saveProductRecord(product);

      // Update local list
      allProducts.add(product);

      selectedImagePath.value = ''; // Reset image
      FFullScreenLoader.stopLoading();
      FLoaders.sucessSnackBar(title: 'Success', message: 'Product added successfully');
      Get.back();
    } catch (e) {
      FFullScreenLoader.stopLoading();
      FLoaders.erroSnackBar(title: 'Error', message: e.toString());
    }
  }

  /// Update Banner
  Future<void> updateBanner(String oldImageUrl, String targetScreen, bool active) async {
    try {
      FFullScreenLoader.openLoadingDialog('Updating Banner...', 'assets/images/animations/trail_loading.json');

      String url = oldImageUrl;
      if (selectedImagePath.value.isNotEmpty) {
        url = await bannerRepository.uploadBannerImage(XFile(selectedImagePath.value));
      }

      final banner = BannerModel(
        imageUrl: url,
        targetScreen: targetScreen,
        active: active,
      );

      await bannerRepository.saveBannerRecord(banner);
      
      int index = allBanners.indexWhere((item) => item.imageUrl == oldImageUrl);
      if (index >= 0) allBanners[index] = banner;

      selectedImagePath.value = '';
      FFullScreenLoader.stopLoading();
      FLoaders.sucessSnackBar(title: 'Success', message: 'Banner updated successfully');
      Get.back();
    } catch (e) {
      FFullScreenLoader.stopLoading();
      FLoaders.erroSnackBar(title: 'Error', message: e.toString());
    }
  }

  /// Update Product
  Future<void> updateProduct({
    required String id,
    required String title,
    required String brand,
    required double price,
    required String categoryId,
    required String description,
    required String oldThumbnailUrl,
    String productType = 'single',
    List<ProductAttributeModel>? productAttributes,
    List<ProductVariationModel>? productVariations,
  }) async {
    try {
      FFullScreenLoader.openLoadingDialog('Updating Product...', 'assets/images/animations/trail_loading.json');

      String url = oldThumbnailUrl;
      if (selectedImagePath.value.isNotEmpty) {
        url = await productRepository.uploadProductImage(XFile(selectedImagePath.value));
      }

      final product = ProductModel(
        id: id,
        title: title,
        brand: brand,
        price: price,
        thumbnail: url,
        categoryId: categoryId,
        description: description,
        productType: productType,
        productAttributes: productAttributes,
        productVariations: productVariations,
      );

      await productRepository.saveProductRecord(product);
      
      int index = allProducts.indexWhere((item) => item.id == id);
      if (index >= 0) allProducts[index] = product;

      selectedImagePath.value = '';
      FFullScreenLoader.stopLoading();
      FLoaders.sucessSnackBar(title: 'Success', message: 'Product updated successfully');
      Get.back();
    } catch (e) {
      FFullScreenLoader.stopLoading();
      FLoaders.erroSnackBar(title: 'Error', message: e.toString());
    }
  }

  /// Add Banner
  Future<void> addBanner(String targetScreen, bool active) async {
    try {
      if (selectedImagePath.value.isEmpty) throw 'Please select an image';

      FFullScreenLoader.openLoadingDialog('Uploading Banner...', 'assets/images/animations/trail_loading.json');

      // Upload Image to Cloudinary
      final url = await bannerRepository.uploadBannerImage(XFile(selectedImagePath.value));

      // Create Model
      final banner = BannerModel(
        imageUrl: url,
        targetScreen: targetScreen,
        active: active,
      );

      // Save to Firestore
      await bannerRepository.saveBannerRecord(banner);

      // Update local list
      allBanners.add(banner);

      selectedImagePath.value = ''; // Reset image
      FFullScreenLoader.stopLoading();
      FLoaders.sucessSnackBar(title: 'Success', message: 'Banner added successfully');
      Get.back();
    } catch (e) {
      FFullScreenLoader.stopLoading();
      FLoaders.erroSnackBar(title: 'Error', message: e.toString());
    }
  }

  /// Seed Dummy Data
  Future<void> seedDummyData() async {
    try {
      FFullScreenLoader.openLoadingDialog('Seeding Dummy Data...', 'assets/images/animations/trail_loading.json');

      // Seed Banners
      for (var banner in FDummyData.banners) {
        await bannerRepository.saveBannerRecord(banner);
      }

      // Seed Categories
      for (var category in FDummyData.categories) {
        await categoryRepository.saveCategoryRecord(category);
      }

      // Seed Brands
      for (var brand in FDummyData.brands) {
        await brandRepository.saveBrandRecord(brand);
      }

      // Seed Products
      for (var product in FDummyData.products) {
        await productRepository.saveProductRecord(product);
      }

      await fetchData(); // Refresh data
      FFullScreenLoader.stopLoading();
      FLoaders.sucessSnackBar(title: 'Success', message: 'Dummy data seeded successfully!');
    } catch (e) {
      FFullScreenLoader.stopLoading();
      FLoaders.erroSnackBar(title: 'Error', message: e.toString());
    }
  }
}
