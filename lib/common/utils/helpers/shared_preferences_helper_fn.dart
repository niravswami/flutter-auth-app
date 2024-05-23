import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/shared_preferences_constants.dart';

class SharedPreferencesHelper {
  static final serviceLocator = GetIt.instance;

  static Future<String?> getToken() async {
    final sharedPreferences = serviceLocator<SharedPreferences>();
    return sharedPreferences.getString(SharedPreferencesKeyConstants.token);
  }

  static Future<void> saveToken(String token) async {
    final sharedPreferences = serviceLocator<SharedPreferences>();
    await sharedPreferences.setString(
        SharedPreferencesKeyConstants.token, token);
    return;
  }

  static Future<void> removeToken() async {
    final sharedPreferences = serviceLocator<SharedPreferences>();
    await sharedPreferences.remove(SharedPreferencesKeyConstants.token);
    return;
  }

  static Future<void> setThemeMode(bool isDarkMode) async {
    final sharedPreferences = serviceLocator<SharedPreferences>();
    await sharedPreferences.setBool(
        SharedPreferencesKeyConstants.isDarkMode, isDarkMode);
    return;
  }

  static bool isDarkMode() {
    final sharedPreferences = serviceLocator<SharedPreferences>();
    return sharedPreferences
            .getBool(SharedPreferencesKeyConstants.isDarkMode) ??
        false;
  }
}
