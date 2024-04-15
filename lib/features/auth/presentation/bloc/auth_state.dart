part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthUserLoggedIn extends AuthState {
  final UserEntity user;
  const AuthUserLoggedIn(this.user);
}

final class AuthFailure extends AuthState {
  final String message;
  const AuthFailure(this.message);
}

final class AuthErrors extends AuthState {
  final int? statusCode;
  final String message;
  final Map<String, dynamic>? errors;

  const AuthErrors({
    this.statusCode,
    required this.message,
    this.errors,
  });
}

final class AuthLogoutProcessing extends AuthState {}

final class AuthLogoutErrors extends AuthState {
  final int? statusCode;
  final String message;
  final Map<String, dynamic>? errors;

  const AuthLogoutErrors({
    this.statusCode,
    required this.message,
    this.errors,
  });
}
