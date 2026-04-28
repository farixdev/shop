import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shop/data/repositories/user/user_repositry.dart';
import 'package:shop/features/personalization/models/user_model.dart';
import 'package:shop/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel?> user = UserModel.empty().obs;
  final userRepositry = Get.put(UserRepositry());

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
    } finally{
      profileLoading.value = false;
    }
  }

  //save user record from and Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
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
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          username: username,
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          ProfilePicture: userCredentials.user!.photoURL ?? '',
        );

        //save user data
        await userRepositry.saveUserRecord(user);
      }
    } catch (e) {
      FLoaders.warningSnackBar(
        title: 'data not saved',
        message: 'Something went wrong. Please Try Again',
      );
    }
  }
}
