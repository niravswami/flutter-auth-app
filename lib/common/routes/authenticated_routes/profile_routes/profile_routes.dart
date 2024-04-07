import 'package:go_router/go_router.dart';

import '../../../../features/user_profile/presentation/screens/user_profile.dart';
import '../../../../features/user_profile/presentation/screens/user_profile_settings_screen.dart';
import '../../routes_constants.dart';

class ProfileAppRoutes {
  GoRoute get routes => _routes;

  final _routes = GoRoute(
    path: AppPage.profile.toPath,
    name: AppPage.profile.toName,
    builder: (context, state) => const UserProfileScreen(),
    routes: [
      GoRoute(
        path: AppPage.profileSettings.toPath,
        name: AppPage.profileSettings.toName,
        builder: (context, state) => const UserProfileSettingsScreen(),
      ),
    ],
  );
}
