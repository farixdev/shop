import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shop/data/repositories/authentication/authentication_repository.dart';
import 'package:shop/data/repositories/user/user_repositry.dart';
import 'package:shop/features/authentication/screens/signup/verif_email.dart';
import 'package:shop/features/personalization/models/user_model.dart';
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
      if (!isConnected) {
        FFullScreenLoader.stopLoading();
        return;
      }
      

      ///Form Validation
      if (!signupFormKey.currentState!.validate()) {
        FFullScreenLoader.stopLoading();
        return;
      }

      ///Privacy Policy Check
      if (!privacyPolicy.value) {
        FLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create account, you must have to read  and accept our privacy policy.',
        );
        return;
      }

      ///Register User in firebase authentication & save user data in the firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );

      ///Save user data in firestore database
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        ProfilePicture: '',
      );

      final userRepositry = Get.put(UserRepositry());
      await userRepositry.saveUserRecord(newUser);

      FFullScreenLoader.stopLoading();

      ///show sucess message
      FLoaders.sucessSnackBar(
        title: 'Congratulations',
        message: 'Your account has been created! Verify your email.',
      );

      ///Move to verufy email screen
      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      //Remove Loader
      FFullScreenLoader.stopLoading();
      //show some generic error to the user
      FLoaders.erroSnackBar(title: 'oh Snap!', message: e.toString());
    }
  }
}
