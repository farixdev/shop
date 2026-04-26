import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/network/network_manager.dart';
import 'package:shop/utils/popups/full_screen_loader.dart';
import 'package:shop/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //Variables
  final hidePassword = true.obs; //observable for hidding/showing password
  final privacyPolicy = true.obs;
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
      FFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        FImages.loader,
      );

      ///Check Internet Conectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      ///Form Validation
      if (!signupFormKey.currentState!.validate()) return;

      ///Privacy Policy Check
      ///Register User in firebase authentication & save user data in the firebase
      ///Save user data in firestore database
      ///show sucess message
      ///Move to verufy email screen
    } catch (e) {
      //show some generic error to the user
      FLoaders.erroSnackBar(title: 'oh Snap!', message: e.toString());
    } finally {
      //Remove Loader
      FFullScreenLoader.stopLoading();
    }
  }
}
