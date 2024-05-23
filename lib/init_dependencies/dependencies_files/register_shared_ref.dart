// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterSharedPref {
  final GetIt serviceLocator;

  RegisterSharedPref({
    required this.serviceLocator,
  });

  Future<void> registerSharedPref() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      serviceLocator.registerSingleton<SharedPreferences>(sharedPreferences);
    } catch (e) {
      // Handle any errors, e.g., logging, fallback mechanisms, etc.
      print('Error initializing SharedPreferences: $e');
    }
  }
}
