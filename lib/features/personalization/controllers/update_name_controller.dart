import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:shop/data/repositories/user/user_repositry.dart';
import 'package:shop/features/personalization/controllers/user_controller.dart';
import 'package:shop/features/personalization/screens/profile/profile.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/network/network_manager.dart';
import 'package:shop/utils/popups/full_screen_loader.dart';
import 'package:shop/utils/popups/loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepositry = Get.put(UserRepositry());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  //init user data when home screen apears
  @override
  void onInit() {
    initializeName();
    super.onInit();
  }

  //Fetch user record
  Future<void> initializeName() async {
    firstName.text = userController.user.value!.firstName;
    lastName.text = userController.user.value!.lastName;
  }

  Future<void> updateUserName() async {
    try {
      //start loading
      FFullScreenLoader.openLoadingDialog(
        'We are updating your information',
        FImages.loader,
      );

      //check internet connectivity

      ///Check Internet Conectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        FFullScreenLoader.stopLoading();
        return;
      }

      //update user first and last name in firebase store
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim(),
      };
      await userRepositry.updateSingleField(name);

      //update the Rx user value
      userController.user.value!.firstName = firstName.text.trim();
      userController.user.value!.lastName = lastName.text.trim();

      //remove loader
      FFullScreenLoader.stopLoading();

      //show sucess message
      FLoaders.sucessSnackBar(
        title: 'Congratulations',
        message: 'Your name has been updated',
      );

      //move to previous screen
      Get.offAll(() => ProfileScreen());
    } catch (e) {
      FFullScreenLoader.stopLoading();
      FLoaders.erroSnackBar(title: 'oh Snap!', message: e.toString());
    }
  }
}
