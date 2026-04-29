import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop/data/repositories/authentication/authentication_repository.dart';
import 'package:shop/data/repositories/user/user_repositry.dart';

import 'package:shop/features/authentication/screens/login/login.dart';
import 'package:shop/features/personalization/models/user_model.dart';
import 'package:shop/features/personalization/screens/profile/widget/re_authenticate_user_login_form.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/network/network_manager.dart';
import 'package:shop/utils/popups/full_screen_loader.dart';
import 'package:shop/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel?> user = UserModel.empty().obs;

  final hidepassword = false.obs;
  final verifyEmail = TextEditingController();
  final imageUploading = false.obs;
  final verifyPassword = TextEditingController();
  final userRepositry = Get.put(UserRepositry());

  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepositry.fetchUserDetails();
      this.user(user);
      profileLoading.value = false;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  //save user record from and Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      //Refresh user record
      await fetchUserRecord();
      if (user.value!.id.isEmpty) {
        if (userCredentials != null) {
          //Convert name to first and last name
          final nameParts = UserModel.nameParts(
            userCredentials.user!.displayName ?? '',
          );
          final username = UserModel.generateUsername(
            userCredentials.user!.displayName ?? '',
          );

          //map data
          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1
                ? nameParts.sublist(1).join(' ')
                : '',
            username: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );

          //save user data
          await userRepositry.saveUserRecord(user);
        }
      }
    } catch (e) {
      FLoaders.warningSnackBar(
        title: 'data not saved',
        message: 'Something went wrong. Please Try Again',
      );
    }
  }

  //DeleteAccountWaringPopup
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(FSizes.md),
      title: 'Delete Account?',
      middleText:
          'Are you sure you want to delete your acccount permanently? This section cannot be undone.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: FSizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text('Cancel'),
      ),
    );
  }

  //Delete User account
  void deleteUserAccount() async {
    try {
      FFullScreenLoader.openLoadingDialog('Processing', FImages.loader);

      //First Re authenticate user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData
          .map((e) => e.providerId)
          .first;
      if (provider.isNotEmpty) {
        //Re Verify auth email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          FFullScreenLoader.stopLoading();
          Get.offAll(() => LoginScreen());
        } else if (provider == 'password') {
          FFullScreenLoader.stopLoading();
          Get.to(() => ReAuthLoginForm());
        }
      }
    } catch (e) {
      FFullScreenLoader.stopLoading();
      FLoaders.warningSnackBar(title: 'oh Snap!', message: e.toString());
    }
  }

  Future<void> reAuthenticateEailandPasswordUser() async {
    try {
      FFullScreenLoader.openLoadingDialog('Processing', FImages.loader);

      //check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        FFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateUserWithEmailAndPassword(
            verifyEmail.text.trim(),
            verifyPassword.text.trim(),
          );
      await AuthenticationRepository.instance.deleteAccount();

      FFullScreenLoader.stopLoading();
      Get.offAll(() => LoginScreen());
    } catch (e) {
      FFullScreenLoader.stopLoading();
      FLoaders.warningSnackBar(title: 'oh Snap!', message: e.toString());
    }
  }

  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxWidth: 512,
        maxHeight: 512,
      );

      //to do add a crop option to image and confirm

      if (image != null) {
        imageUploading.value = true;
        //upload image
        final imageUrl = await userRepositry.uploadImage(
          'Users/Images/Profile/',
          image,
        );

        //update user image record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};

        await userRepositry.updateSingleField(json);

        user.value!.profilePicture = imageUrl; 
        user.refresh();
        
        FLoaders.sucessSnackBar(
          title: 'Congratulations',
          message: 'Image Updated',
        );
      }
    } catch (e) {
      FLoaders.erroSnackBar(title: 'oh Snap!', message: e.toString());
    }finally{
      imageUploading.value = false;
    }
  }
}
