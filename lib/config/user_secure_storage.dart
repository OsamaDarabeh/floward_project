import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static final _storage = FlutterSecureStorage();

  static const VALUE_AR_LANGUAGE = "ar";
  static const VALUE_EN_LANGUAGE = "en";
  static const _keyLanguage = "language";

  static Future setLanguage(String language) async =>
      await _storage.write(key: _keyLanguage, value: language);

  static Future<String> getLanguage() async =>
      await _storage.read(key: _keyLanguage) ?? VALUE_EN_LANGUAGE;
}
