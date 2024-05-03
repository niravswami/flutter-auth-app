enum AppPage {
  home,
  // non authenticated routes
  splash,
  onBoarding,
  authWelcome,
  login,
  signUp,
  forgotPassword,
  emailVerification,
  //-> non authenticated routes
  //->
  // authenticated routes
  entryPoint,
  profile,
  profileSettings,
  notifications,
  //-> authenticated routes
  //->
  // admin panel
  adminPanel,
  adminDashboard,
  adminECommerce,
  adminInbox,
  adminUsers,
  adminRolesAndPermissions,
  adminRoles,
  adminPermissions,
  adminUserRoles,
  adminPaymentGateways,
  // -> admin panel
  // ->
  // common routes
  error,
}

extension AppPageExtension on AppPage {
  String get toPath {
    switch (this) {
      case AppPage.home:
        return "/";
      // non authenticated routes
      case AppPage.splash:
        return "/splash";
      case AppPage.authWelcome:
        return "/auth";
      case AppPage.login:
        return "login";
      case AppPage.signUp:
        return "sign-up";
      case AppPage.forgotPassword:
        return "forgot-password";
      case AppPage.emailVerification:
        return "/email-verification";
      case AppPage.onBoarding:
        return "/onboarding";
      //->non authenticated routes
      //->
      // authenticated routes
      case AppPage.profile:
        return "/profile";
      case AppPage.profileSettings:
        return "profile-settings";
      case AppPage.notifications:
        return "notifications";
      //-> authenticated routes
      //->
      // admin dashboard
      case AppPage.adminPanel:
        return "/admin-panel";
      case AppPage.adminDashboard:
        return "admin-dashboard";
      case AppPage.adminECommerce:
        return "admin-e-commerce";
      case AppPage.adminInbox:
        return "admin-inbox";
      case AppPage.adminUsers:
        return "admin-users";
      case AppPage.adminRolesAndPermissions:
        return "admin-roles-and-permissions";
      case AppPage.adminRoles:
        return "admin-roles";
      case AppPage.adminPermissions:
        return "admin-permissions";
      case AppPage.adminUserRoles:
        return "admin-user-roles";
      case AppPage.adminPaymentGateways:
        return "admin-payment-gateways";
      //-> admin dashboard
      // ->
      // common routes
      case AppPage.error:
        return "/error";
      default:
        return "/";
    }
  }

  String get toName {
    switch (this) {
      case AppPage.home:
        return "HOME";
      // non authenticated routes
      case AppPage.splash:
        return "SPLASH";
      case AppPage.onBoarding:
        return "START";
      case AppPage.authWelcome:
        return "AUTH_WELCOME";
      case AppPage.login:
        return "LOGIN";
      case AppPage.forgotPassword:
        return "FORGOT_PASSWORD";
      case AppPage.signUp:
        return "SIGN_UP";
      case AppPage.emailVerification:
        return "EMAIL_VERIFICATION";
      //->non authenticated routes
      //->
      // authenticated routes
      case AppPage.profile:
        return "PROFILE";
      case AppPage.profileSettings:
        return "PROFILE_SETTINGS";
      case AppPage.notifications:
        return "NOTIFICATIONS";
      //-> authenticated routes
      //->
      // admin dashboard
      case AppPage.adminPanel:
        return "ADMIN_PANEL";
      case AppPage.adminDashboard:
        return "ADMIN_DASHBOARD";
      case AppPage.adminECommerce:
        return "ADMIN_E_COMMERCE";
      case AppPage.adminInbox:
        return "ADMIN_INBOX";
      case AppPage.adminUsers:
        return "ADMIN_USERS";
      case AppPage.adminRolesAndPermissions:
        return "ADMIN_ROLES_AND_PERMISSIONS";
      case AppPage.adminRoles:
        return "ADMIN_ROLES";
      case AppPage.adminPermissions:
        return "ADMIN_PERMISSIONS";
      case AppPage.adminUserRoles:
        return "ADMIN_USER_ROLEs";
      case AppPage.adminPaymentGateways:
        return "ADMIN_PAYMENT_GATEWAYS";
      //-> admin dashboard
      //->
      // common routes
      case AppPage.error:
        return "ERROR";
      default:
        return "HOME";
    }
  }

  String get toFullPath {
    switch (this) {
      case AppPage.home:
        return "/";
      // non authenticated routes
      case AppPage.splash:
        return "/splash";
      case AppPage.authWelcome:
        return "/auth";
      case AppPage.login:
        return "/auth/login";
      case AppPage.signUp:
        return "/auth/sign-up";
      case AppPage.forgotPassword:
        return "/auth/forgot-password";
      case AppPage.emailVerification:
        return "/email-verification";
      case AppPage.onBoarding:
        return "/onboarding";
      // -> non authenticated routes
      // ->
      // authenticated routes
      case AppPage.profile:
        return "/profile";
      case AppPage.profileSettings:
        return "/profile/profile-settings";
      case AppPage.notifications:
        return "/notifications";
      //-> authenticated routes
      //->
      // admin dashboard
      case AppPage.adminPanel:
        return "/admin-panel";
      case AppPage.adminDashboard:
        return "/admin-panel/admin-dashboard";
      case AppPage.adminECommerce:
        return "/admin-panel/admin-e-commerce";
      case AppPage.adminInbox:
        return "/admin-panel/admin-inbox";
      case AppPage.adminUsers:
        return "/admin-panel/admin-users";
      case AppPage.adminRolesAndPermissions:
        return "/admin-panel/admin-roles-and-permissions";
      case AppPage.adminRoles:
        return "/admin-panel/admin-roles";
      case AppPage.adminPermissions:
        return "/admin-panel/admin-permissions";
      case AppPage.adminUserRoles:
        return "/admin-panel/admin-user-roles";
      case AppPage.adminPaymentGateways:
        return "/admin-panel/admin-payment-gateways";
      //-> admin dashboard
      //->
      // common routes
      case AppPage.error:
        return "/error";
      default:
        return "/";
    }
  }

  String get toTitle {
    switch (this) {
      case AppPage.home:
        return "My App";
      case AppPage.authWelcome:
        return "Auth Welcome";
      case AppPage.login:
        return "My App Log In";
      case AppPage.splash:
        return "My App Splash";
      case AppPage.error:
        return "My App Error";
      case AppPage.onBoarding:
        return "Welcome to My App";
      default:
        return "My App";
    }
  }
}

class RouteConstants {
  static List<String> unauthenticatedFullRouteList = [
    AppPage.splash.toFullPath,
    AppPage.onBoarding.toFullPath,
    AppPage.authWelcome.toFullPath,
    AppPage.login.toFullPath,
    AppPage.signUp.toFullPath,
    AppPage.forgotPassword.toFullPath,
  ];
}
