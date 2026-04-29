import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop/features/shop/models/category_model.dart';
import 'package:shop/utils/exceptions/firebase_exceptions.dart';
import 'package:shop/utils/exceptions/platform_exceptions.dart';
import 'package:shop/utils/helpers/cloudinary_helper.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  //variables
  final _db = FirebaseFirestore.instance;

  //get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw FFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw FPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please Try Again";
    }
  }

  //upload any image to Cloudinary
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final url = await FCloudinaryHelper.uploadImage(image);
      return url;
    } on FirebaseException catch (e) {
      throw FFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw FPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please Try Again";
    }
  }

  //function to upload categories to Firestore
  Future<void> saveCategoryRecord(CategoryModel category) async {
    try {
      await _db.collection("Categories").doc(category.id).set(category.toJson());
    } on FirebaseException catch (e) {
      throw FFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw FPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please Try Again";
    }
  }
}
