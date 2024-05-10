import 'package:dio/dio.dart';

import '../../../../common/services/api_services/api_service.dart';
import '../../../../common/constants/api_constants.dart';
import '../../../../common/errors/dio_exception_handling/dio_server_exception.dart';
import '../../../../common/errors/error_exception_handler.dart';
import '../../../../common/services/device_info_service.dart';
import '../models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<Map<String, dynamic>> loginWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Map<String, dynamic>> userSignUp({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  });

  Future<UserModel> getAuthUserDetail();

  Future<Map<String, dynamic>> logout();
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDataSourceImpl({required this.apiService});

  @override
  Future<Map<String, dynamic>> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    final deviceName = await DeviceInfoService.getDeviceName();
    try {
      final response =
          await apiService.postReq(AuthApiEndpointConstants.login, {
        'email': email,
        'password': password,
        'device_name': deviceName,
      });

      return response;
    } on DioException catch (e) {
      String message = 'An unexpected error occurred!';
      if (e.response != null) {
        message = e.response!.data['message'];
        throw DioServerException(
            message: message, errors: e.response!.data['errors']);
      } else if (e.message != null) {
        message = e.message!;
      }
      throw DioServerException(message: message);
    } catch (e) {
      throw DioServerException(message: e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>> userSignUp({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    return errorExceptionHandler(() async {
      final response =
          await apiService.postReq(AuthApiEndpointConstants.register, {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
      });

      return response;
    });
  }

  // @override
  // Future<Map<String, dynamic>> userSignUp({
  //   required String name,
  //   required String email,
  //   required String password,
  //   required String passwordConfirmation,
  // }) async {
  //   try {
  //     final response =
  //         await apiService.postReq(AuthApiEndpointConstants.register, {
  //       'name': name,
  //       'email': email,
  //       'password': password,
  //       'password_confirmation': passwordConfirmation,
  //     });

  //     return response;
  //   } on DioException catch (e) {
  //     String message = 'An unexpected error occurred!';
  //     if (e.response != null) {
  //       message = e.response!.data['message'];
  //       throw DioServerException(
  //           message: message, errors: e.response!.data['errors']);
  //     } else if (e.message != null) {
  //       message = e.message!;
  //     }
  //     throw DioServerException(message: message);
  //   } catch (e) {
  //     throw DioServerException(message: e.toString());
  //   }
  // }

  @override
  Future<UserModel> getAuthUserDetail() async {
    return errorExceptionHandler(() async {
      final response =
          await apiService.getReq(AuthApiEndpointConstants.getUserDetail);
      final user = UserModel.fromJson(response);
      return user;
    });
  }

  @override
  Future<Map<String, dynamic>> logout() {
    return errorExceptionHandler(() async {
      final response =
          await apiService.postReq(AuthApiEndpointConstants.logout, {});
      return response;
    });
  }

  // @override
  // Future<UserModel> getAuthUserDetail() async {
  //   try {
  //     final response =
  //         await apiService.getReq(AuthApiEndpointConstants.getUserDetail);

  //     final user = UserModel.fromJson(response['user']);
  //     return user;
  //   } on DioException catch (e) {
  //     print(e);
  //     String message = 'An unexpected error occurred!';
  //     if (e.response != null) {
  //       message = e.response!.data['message'];
  //       throw DioServerException(
  //           message: message, errors: e.response!.data['errors']);
  //     } else if (e.message != null) {
  //       message = e.message!;
  //     }
  //     throw DioServerException(message: message);
  //   } catch (e) {
  //     throw DioServerException(message: e.toString());
  //   }
  // }

  // -----------------------
}
