import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shop/utils/helpers/cloudinary_helper.dart';

class FCloudinaryService extends GetxController {
  static FCloudinaryService get instance => Get.find();

  /// Load image as bytes from assets
  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      throw 'Unable to load image from assets: $e';
    }
  }

  /// Upload byte data to Cloudinary
  Future<String> uploadImageData(String path, Uint8List image, String name) async {
    try {
      final url = Uri.parse('https://api.cloudinary.com/v1_1/${FCloudinaryHelper.cloudName}/image/upload');
      
      final request = http.MultipartRequest('POST', url)
        ..fields['upload_preset'] = FCloudinaryHelper.uploadPreset
        ..files.add(http.MultipartFile.fromBytes('file', image, filename: name));

      final response = await request.send();
      
      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseData);
        return jsonResponse['secure_url'];
      } else {
        throw 'Failed to upload image to Cloudinary. Status code: ${response.statusCode}';
      }
    } catch (e) {
      throw 'Error uploading image to Cloudinary: $e';
    }
  }
}
