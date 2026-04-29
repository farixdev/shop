import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop/data/services/cloudinary_service.dart';
import 'package:shop/features/shop/models/product_model.dart';
import 'package:shop/utils/exceptions/firebase_exceptions.dart';
import 'package:shop/utils/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Get all products
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final snapshot = await _db.collection('Products').get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw FFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw FPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Save product record
  Future<void> saveProductRecord(ProductModel product) async {
    try {
      await _db.collection('Products').doc(product.id).set(product.toJson());
    } on FirebaseException catch (e) {
      throw FFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw FPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload product image
  Future<String> uploadProductImage(XFile image) async {
    try {
      final storage = Get.put(FCloudinaryService());
      final bytes = await image.readAsBytes();
      final url = await storage.uploadImageData('Products', bytes, image.name);
      return url;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
  /// Get products for category
  Future<List<ProductModel>> getProductsForCategory(String categoryId) async {
    try {
      final snapshot = await _db.collection('Products').where('CategoryId', isEqualTo: categoryId).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get favorite products
  Future<List<ProductModel>> getFavouriteProducts(List<String> productIds) async {
    try {
      if (productIds.isEmpty) return [];
      final snapshot = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Delete product
  Future<void> deleteProduct(String productId) async {
    try {
      await _db.collection('Products').doc(productId).delete();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
