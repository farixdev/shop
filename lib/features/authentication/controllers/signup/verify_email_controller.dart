import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:shop/common/widgets/sucess_screen/sucess_screen.dart';
import 'package:shop/data/repositories/authentication/authentication_repository.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/constants/text_strings.dart';
import 'package:shop/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  //Send Email Whenever Verify screen apears

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  //Send email verification link
  Future<void> sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      FLoaders.sucessSnackBar(
        title: 'Email Sent',
        message: 'Please check your inbox and verify your email',
      );
    } catch (e) {
      FLoaders.erroSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //timer to automatically redirect on email verification
  void setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SucessScreen(
            title: FTexts.yourAccountCreatedTitle,
            image: FImages.successImage,
            subTitle: FTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }

  //Manually check if email is verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SucessScreen(
          title: FTexts.yourAccountCreatedTitle,
          image: FImages.successImage,
          subTitle: FTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );  
    }
  }
}
