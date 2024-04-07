part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;

  const AuthLoginEvent({
    required this.email,
    required this.password,
  });
}

class AuthSignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;

  const AuthSignUpEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });
}

class AuthGetUserDetail extends AuthEvent {}

class AuthUserLogout extends AuthEvent {}
