import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop/data/repositories/authentication/authentication_repository.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/network/network_manager.dart';
import 'package:shop/utils/popups/full_screen_loader.dart';
import 'package:shop/utils/popups/loaders.dart';

class LoginController extends GetxController {
  //variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  //Email and password sign in
  Future<void> emailAndPasswordSignIn() async {
    try {
      FFullScreenLoader.openLoadingDialog('Logging you in...', FImages.loader);

      final isConneted = await NetworkManager.instance.isConnected();
      if (!isConneted) {
        FFullScreenLoader.stopLoading();
        return;
      }

      //form validation

      if (!loginFormKey.currentState!.validate()) {
        FFullScreenLoader.stopLoading();
        return;
      }

      //save data id remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      //LOGIN USER using email and password authentication
      //final userCredential = await AuthenticationRepository.instance
      //.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //Remove Loader

      FFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      FFullScreenLoader.stopLoading();
      FLoaders.erroSnackBar(title: 'oh snao', message: e.toString());
    }
  }
}
