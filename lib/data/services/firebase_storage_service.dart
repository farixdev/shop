

class FFirebaseStorageService extends GetxController{
  //Get single instance
  static FFirebaseStorageService get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  //upload local asset from ide
  //returnes byte array
  Future<Uint8List> getImageDatafromAssets(String path)async{
    try{
      //Load image as bytes from the application assets
      final byteData = await rootBundle.load(path);
      
      //Convert the byteData to a Uint8List
      final imageData = byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);

      return imageData;
    }catch(e){
      throw 'Unable to load data image. Try again.';
    }
  }


  Future<String>uploadImageData(String path, Uint8List image, String name)async{
    try {
      //get a reference to the storage service
      final ref = _firebaseStorage.ref().child(path).child(name);
      
      //upload the data
      await ref.putData(image);
      
      //get the download URL
      final url = await ref.getDownloadURL();
      
      return url;
    } catch (e) {
      throw 'Unable to upload image. Try again.';
    }
  }
}