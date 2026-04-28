import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shop/data/repositories/authentication/authentication_repository.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/network/network_manager.dart';
import 'package:shop/utils/popups/full_screen_loader.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController instance = Get.find();

  //variables
  final email = TextEditingController();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  //send reset password email
  sendPasswordResetEmail() async {
    try {
      //start loading
      FFullScreenLoader.openLoadingDialog(
        'Processing your request',
        FImages.loader,
      );

      //check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!forgotPasswordFormKey.currentState!.validate()) {
        FFullScreenLoader.stopLoading();
        return;
      }
      
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());  

      //remove loader
      FFullScreenLoader.stopLoading();  

    } catch (e) {}
  }

  resendSendPasswordResetEmail() async {
    try {} catch (e) {}
  }
}
