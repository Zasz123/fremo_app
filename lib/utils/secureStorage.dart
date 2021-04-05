import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageUtil {
  static final SecureStorageUtil _instance = SecureStorageUtil._();
  static FlutterSecureStorage _storage;

  SecureStorageUtil._() {
    _storage = new FlutterSecureStorage();
  }

  factory SecureStorageUtil() {
    return _instance;
  }

  static Future<String> getData(String key) async {
    return await _storage.read(key: key);
  }

  static Future<void> setData(String key, String value) async {
    await _storage.write(key: key, value: value);
  }
}
