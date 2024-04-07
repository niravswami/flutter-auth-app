import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static final serviceLocator = GetIt.instance;

  static Future<String?> getToken() async {
    final sharedPreferences = serviceLocator<SharedPreferences>();
    return sharedPreferences.getString('token');
  }

  static Future<void> saveToken(String token) async {
    final sharedPreferences = serviceLocator<SharedPreferences>();
    await sharedPreferences.setString('token', token);
    return;
  }

  static Future<void> removeToken() async {
    final sharedPreferences = serviceLocator<SharedPreferences>();
    await sharedPreferences.remove('token');
    return;
  }
}
