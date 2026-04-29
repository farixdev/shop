import 'package:get/get.dart';
import 'package:shop/data/repositories/categories/category_repository.dart';
import 'package:shop/features/shop/models/category_model.dart';
import 'package:shop/utils/popups/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  ///Load Category data
  Future<void> fetchCategories() async {
    try {
      //  Show loader while loading categories
      isLoading.value = true;

      //fetch categories from data source (firestore, Api)
      final categories = await _categoryRepository.getAllCategories();

      //update the categories list
      allCategories.assignAll(categories);

      //filter featured categories
      featuredCategories.assignAll(
        allCategories
            .where(
              (categories) =>
                  categories.isFeatured && categories.parentId.isEmpty,
            )
            .take(8)
            .toList(),
      );
    } catch (e) {
      FLoaders.erroSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      //remove loader
      isLoading.value = false;  
    }
  }

  ///Load Selected Category data
  ///get category or sub category
}
