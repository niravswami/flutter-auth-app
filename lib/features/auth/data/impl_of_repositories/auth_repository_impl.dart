import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/entities/user_entity.dart';
import '../../../../common/errors/dio_exception_handling/dio_server_exception.dart';
import '../../../../common/errors/error_exception_handler.dart';
import '../../../../common/errors/failure.dart';
import '../../../../common/utils/helpers/shared_preferences_helper_fn.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_source/auth_remote_data_source.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final SharedPreferences sharedPreferences;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.sharedPreferences,
  });

  @override
  Future<Either<Failure, UserModel>> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await authRemoteDataSource.loginWithEmailPassword(
        email: email,
        password: password,
      );

      final token = response['token'];
      // ApiService.saveToken(token);
      await SharedPreferencesHelper.saveToken(token);
      final user = UserModel.fromJson(response['user']);
      return right(user);
    } on DioServerException catch (e) {
      return left(Failure(message: e.message, errors: e.errors));
    }
  }

  @override
  Future<Either<Failure, UserModel>> userSignUp({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await authRemoteDataSource.userSignUp(
        name: name,
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );

      final user = UserModel.fromJson(response['user']);
      return right(user);
    } on DioServerException catch (e) {
      return left(Failure(message: e.message, errors: e.errors));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUserDetail() async {
    return eitherErrorExceptionHandler(
      () async {
        final user = await authRemoteDataSource.getAuthUserDetail();
        return right(user);
      },
    );
  }

  @override
  Future<Either<Failure, String>> logout() {
    return eitherErrorExceptionHandler(
      () async {
        final res = await authRemoteDataSource.logout();
        // await ApiService.removeToken();
        await SharedPreferencesHelper.removeToken();
        return right(res['message']);
      },
    );
  }
}
