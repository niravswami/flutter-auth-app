import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/entities/user_entity.dart';
import '../../../../common/use_case/use_case.dart';
import '../../domain/use_cases/get_user_detail_use_case.dart';
import '../../domain/use_cases/login_use_case.dart';
import '../../domain/use_cases/logout_use_case.dart';
import '../../domain/use_cases/sign_up_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final SignUpUseCase _signUpUseCase;
  final GetUserDetailUseCase _getUserDetailUseCase;
  final LogoutUseCase _logoutUseCase;

  AuthBloc({
    required LoginUseCase loginUseCase,
    required SignUpUseCase signUpUseCase,
    required GetUserDetailUseCase getUserDetailUseCase,
    required LogoutUseCase logoutUseCase,
  })  : _loginUseCase = loginUseCase,
        _signUpUseCase = signUpUseCase,
        _getUserDetailUseCase = getUserDetailUseCase,
        _logoutUseCase = logoutUseCase,
        super(AuthInitial()) {
    // On User login
    on<AuthLoginEvent>(
      (event, emit) async {
        emit(AuthLoading());
        final res = await _loginUseCase(
          LoginParams(
            email: event.email,
            password: event.password,
          ),
        );
        res.fold(
          (l) => emit(AuthErrors(message: l.message, errors: l.errors)),
          (user) => emit(AuthUserLoggedIn(user)),
        );
      },
    );
    // On User Sign Up
    on<AuthSignUpEvent>(
      (event, emit) async {
        emit(AuthLoading());
        final res = await _signUpUseCase(
          SignUpParams(
            email: event.email,
            password: event.password,
            name: event.name,
            passwordConfirmation: event.passwordConfirmation,
          ),
        );
        res.fold(
          (l) => emit(AuthErrors(message: l.message, errors: l.errors)),
          (user) => emit(AuthUserLoggedIn(user)),
        );
      },
    );
    // On Get User Detail
    on<AuthGetUserDetail>(
      (event, emit) async {
        emit(AuthLoading());
        final res = await _getUserDetailUseCase(NoParams());
        res.fold(
          (l) => emit(AuthErrors(message: l.message, errors: l.errors)),
          (user) => emit(AuthUserLoggedIn(user)),
        );
      },
    );
    // On User logout
    on<AuthUserLogout>(
      (event, emit) async {
        emit(AuthLogoutProcessing());
        final res = await _logoutUseCase(NoParams());
        res.fold(
          (l) => emit(AuthLogoutErrors(message: l.message, errors: l.errors)),
          (user) => emit(AuthInitial()),
        );
      },
    );
  }
}
