import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop/features/shop/models/banner_model.dart';
import 'package:shop/utils/exceptions/firebase_exceptions.dart';
import 'package:shop/utils/exceptions/platform_exceptions.dart';
import 'package:shop/utils/helpers/cloudinary_helper.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Get all banners
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final snapshot = await _db.collection('Banners').where('Active', isEqualTo: true).get();
      return snapshot.docs.map((doc) => BannerModel.fromSnapshot(doc)).toList();
    } on FirebaseException catch (e) {
      throw FFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw FPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Save banner to Firestore
  Future<void> saveBannerRecord(BannerModel banner) async {
    try {
      await _db.collection('Banners').add(banner.toJson());
    } on FirebaseException catch (e) {
      throw FFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw FPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload banner image to Cloudinary
  Future<String> uploadBannerImage(XFile image) async {
    try {
      return await FCloudinaryHelper.uploadImage(image);
    } catch (e) {
      throw 'Something went wrong while uploading image to Cloudinary';
    }
  }

  /// Delete banner
  Future<void> deleteBanner(String imageUrl) async {
    try {
      final snapshot = await _db.collection('Banners').where('ImageUrl', isEqualTo: imageUrl).get();
      for (var doc in snapshot.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
