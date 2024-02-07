import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/local_storage/ilocal_storage.dart';

class LocalStorage implements ILocalStorage {
  late SharedPreferences _prefs;

  Future<void> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveUserData(String email, String password) async {
    await _prefs.setString('email', email);
    await _prefs.setString('password', password);
  }

  String get savedEmail => _prefs.getString('email') ?? '';
  String get savedPassword => _prefs.getString('password') ?? '';
}
