import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

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
    } catch (e)
    {
      throw "Something went wrong. Please Try Again";
    }
  }
}
