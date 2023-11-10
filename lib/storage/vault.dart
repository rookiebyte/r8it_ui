import 'package:shared_preferences/shared_preferences.dart';

class Vault {
  static const _tokenKey = "authToken";
  final SharedPreferences _storage;

  Vault._(this._storage);

  static Future<Vault> instance() {
    return SharedPreferences.getInstance().then((it) => Vault._(it));
  }

  bool isTokenAccessible() {
    var value = _storage.getString(_tokenKey);
    return value != null && value.isNotEmpty;
  }

  Future<bool> setAuthToken(String value) {
    return _storage.setString(_tokenKey, value);
  }
}
