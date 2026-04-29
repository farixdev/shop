import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class FCloudinaryHelper {
  static const String cloudName = 'dtavl8box';
  static const String uploadPreset = 'AppEcommerce';

  /// Upload image to Cloudinary and return the secure URL
  static Future<String> uploadImage(XFile image) async {
    try {
      final url = Uri.parse('https://api.cloudinary.com/v1_1/$cloudName/image/upload');
      
      final request = http.MultipartRequest('POST', url)
        ..fields['upload_preset'] = uploadPreset
        ..files.add(await http.MultipartFile.fromPath('file', image.path));

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
