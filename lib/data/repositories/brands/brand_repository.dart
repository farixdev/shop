import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shop/features/shop/models/brand_model.dart';
import 'package:shop/utils/exceptions/firebase_exceptions.dart';
import 'package:shop/utils/exceptions/platform_exceptions.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Get all brands
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      return snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw FFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw FPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Save brand to Firestore
  Future<void> saveBrandRecord(BrandModel brand) async {
    try {
      await _db.collection('Brands').doc(brand.id).set(brand.toJson());
    } on FirebaseException catch (e) {
      throw FFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw FPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Delete brand
  Future<void> deleteBrand(String id) async {
    try {
      await _db.collection('Brands').doc(id).delete();
    } on FirebaseException catch (e) {
      throw FFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw FPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
