import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //Variables
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final firstName = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  //Signup
  Future<void> signup() async {
    try {
      ///Start loading
      ///Check Internet Conectivity
      ///Form Validation
      ///Privacy Policy Check
      ///Register User in firebase authentication & save user data in the firebase
      ///Save user data in firestore database
      ///show sucess message
      ///Move to verufy email screen
    } catch (e) {
    } finally {}
  }
}
