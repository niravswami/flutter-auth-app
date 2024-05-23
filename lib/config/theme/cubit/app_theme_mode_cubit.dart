import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/utils/helpers/shared_preferences_helper_fn.dart';

part 'app_theme_mode_state.dart';

class AppThemeModeCubit extends Cubit<AppThemeModeState> {
  AppThemeModeCubit() : super(AppLightMode());

  toggleThemeMode() async {
    bool isDarkMode = SharedPreferencesHelper.isDarkMode();
    await SharedPreferencesHelper.setThemeMode(!isDarkMode);
    isDarkMode ? emit(AppLightMode()) : emit(AppDarkMode());
  }

  currentThemeMode() async {
    bool isDarkMode = SharedPreferencesHelper.isDarkMode();
    await SharedPreferencesHelper.setThemeMode(isDarkMode);
    isDarkMode ? emit(AppDarkMode()) : emit(AppLightMode());
  }
}
