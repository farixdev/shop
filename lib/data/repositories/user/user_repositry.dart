
import 'dart:io';


import 'package:cloud_firestore/cloud_firestore.dart';



import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';

import 'package:shop/data/repositories/authentication/authentication_repository.dart';
import 'package:shop/utils/helpers/cloudinary_helper.dart';

import 'package:shop/features/personalization/models/user_model.dart';
import 'package:shop/utils/exceptions/firebase_exceptions.dart';
import 'package:shop/utils/exceptions/format_exceptions.dart';
import 'package:shop/utils/exceptions/platform_exceptions.dart';

class UserRepositry extends GetxController {
  static UserRepositry get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //function to save user data to firestore

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw FFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FFormateException();
    } on PlatformException catch (e) {
      throw FPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please Try Again";
    }
  }

  //function to fetch user detail based on user ID
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw FFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FFormateException();
    } on PlatformException catch (e) {
      throw FPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please Try Again";
    }
  }

  //function to update user data in firestore
  Future<void> updateUserDetails(UserModel updateUser) async {
    try {
      await _db
          .collection("Users")
          .doc(updateUser.id)
          .update(updateUser.toJson());
    } on FirebaseException catch (e) {
      throw FFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FFormateException();
    } on PlatformException catch (e) {
      throw FPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please Try Again";
    }
  }

  //update any field in specific user collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
    } on FirebaseException catch (e) {
      throw FFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FFormateException();
    } on PlatformException catch (e) {
      throw FPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please Try Again";
    }
  }

  //function to remove user data from firestore
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseException catch (e) {
      throw FFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FFormateException();
    } on PlatformException catch (e) {
      throw FPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please Try Again";
    }
  }

  //upload any image
  Future<String> uploadImage(String path, XFile image) async {
    try {
      // Use Cloudinary instead of Firebase Storage
      final url = await FCloudinaryHelper.uploadImage(image);
      return url;
    } on FirebaseException catch (e) {
      throw FFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FFormateException();
    } on PlatformException catch (e) {
      throw FPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please Try Again";
    }
  }

  /// One-time setup: seeds admin credentials into Firestore
  /// Call this ONCE (e.g. from a button or on first run) to create the admin record
  Future<void> seedAdminCredentials(String adminEmail) async {
    try {
      await _db.collection('Settings').doc('AdminCredentials').set({
        'AdminEmail': adminEmail,
      });
    } catch (e) {
      throw 'Failed to seed admin credentials: $e';
    }
  }

  /// Check if the given email is the admin email stored in Firestore
  Future<bool> isAdminEmail(String email) async {
    try {
      final doc = await _db.collection('Settings').doc('AdminCredentials').get();
      if (doc.exists) {
        final adminEmail = doc.data()?['AdminEmail'] ?? '';
        return email.toLowerCase() == adminEmail.toString().toLowerCase();
      }
      return false;
    } catch (e) {
      return false;
    }
  }
  /// Fetch all users for Admin
  Future<List<UserModel>> fetchAllUsers() async {
    try {
      final snapshot = await _db.collection("Users").get();
      return snapshot.docs.map((doc) => UserModel.fromSnapshot(doc)).toList();
    } on FirebaseException catch (e) {
      throw FFirebaseException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please Try Again";
    }
  }
}
