part of 'app_theme_mode_cubit.dart';

sealed class AppThemeModeState extends Equatable {
  const AppThemeModeState();

  @override
  List<Object> get props => [];
}

final class AppLightMode extends AppThemeModeState {}

final class AppDarkMode extends AppThemeModeState {}
