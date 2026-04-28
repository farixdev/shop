import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shop/utils/popups/loaders.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  //initialize the network manager and set up a stream to continually check the internet status
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      _updateConnectionStatus,
    );
  }


  //update the connectivity status based on change in connectivity and show a relevant popup for no internet connection
  void _updateConnectionStatus(List<ConnectivityResult> result) {
    final connectivity = result.firstWhere(
      (status) => status != ConnectivityResult.none,
      orElse: () => ConnectivityResult.none,
    );

    _connectionStatus.value = connectivity;
    if (connectivity == ConnectivityResult.none) {
      //add snackbar
      FLoaders.warningSnackBar(title: 'No internet connection');
    }
  }

  //Check the internet connection status
  //return true if connected and false if not connected
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      return result.any((status) => status != ConnectivityResult.none);
    } on PlatformException catch (_) {
      return false;
    }
  }

  
  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }
}
