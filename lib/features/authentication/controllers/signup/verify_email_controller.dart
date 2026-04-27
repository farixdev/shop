import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shop/data/repositories/authentication/authentication_repository.dart';
import 'package:shop/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  //Send Email Whenever Verify screen apears

  @override
  void onInit() {
    sendEmailVerification();
    super.onInit();
  }

  //Send email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      FLoaders.sucessSnackBar(title: 'Email Sent', message: 'Please check your inbox and verify your email');
    } catch (e) {
      FLoaders.erroSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //timer to automatically redirect on email verification
  //Manually check if email is verified
}
