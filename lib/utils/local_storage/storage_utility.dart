import 'package:get_storage/get_storage.dart';

class TLocalStorage {
  static final TLocalStorage _instance = TLocalStorage._internal();

  factory TLocalStorage() {
    return _instance;
  }

  TLocalStorage._internal();
  final _storage = GetStorage();

  //generic methord to save data to local storage
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  //generic method to read data from local storage
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  //generic method to delete data from local storage
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  //clear all data from local storage
  Future<void> clearAll() async {
    await _storage.erase();
  }




}
