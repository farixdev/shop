import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shop/data/repositories/authentication/authentication_repository.dart';
import 'package:shop/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/network/network_manager.dart';
import 'package:shop/utils/popups/full_screen_loader.dart';
import 'package:shop/utils/popups/loaders.dart';

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

      await AuthenticationRepository.instance.sendPasswordResetEmail(
        email.text.trim(),
      );

      //remove loader
      FFullScreenLoader.stopLoading();

      //show sucess screen
      FLoaders.sucessSnackBar(
        title: 'Email Sent',
        message: 'Please check your inbox and verify your email'.tr,
      );

      //Redirect
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      //remove loader
      FFullScreenLoader.stopLoading();
      FLoaders.erroSnackBar(title: 'oh Snap!', message: e.toString());
    }
  }

  resendSendPasswordResetEmail(String email) async {
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

     
      await AuthenticationRepository.instance.sendPasswordResetEmail(
        email,
      );

      //remove loader
      FFullScreenLoader.stopLoading();

      //show sucess screen
      FLoaders.sucessSnackBar(
        title: 'Email Sent',
        message: 'Please check your inbox and verify your email',
      );

   
    } catch (e) {
      //remove loader
      FFullScreenLoader.stopLoading();
      FLoaders.erroSnackBar(title: 'oh Snap!', message: e.toString());
    }
  }
}
