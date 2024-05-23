import 'dart:convert';

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
    return errorExceptionHandler(() async {
      final deviceName = await DeviceInfoService.getDeviceName();
      // final response =
      //     await apiService.postReq(AuthApiEndpointConstants.login, {
      //   'email': email,
      //   'password': password,
      //   'device_name': deviceName,
      // });

      Future.delayed(const Duration(seconds: 2), () {});
      final response = jsonDecode(jsonEncode({
        "token": "abcdefghijklmnolqrstuvwxyz",
        "user": {
          'id': 1,
          "name": 'User Name',
          "email": 'user@aa.aa',
          "email_verified_at": "2024-05-22 18:04:50",
          "created_at": "2024-05-22 18:04:50",
          "updated_at": "2024-05-22 18:04:50",
        }
      }));

      return response;
    });
  }

  @override
  Future<Map<String, dynamic>> userSignUp({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    return errorExceptionHandler(() async {
      // final response =
      //     await apiService.postReq(AuthApiEndpointConstants.register, {
      //   'name': name,
      //   'email': email,
      //   'password': password,
      //   'password_confirmation': passwordConfirmation,
      // });

      Future.delayed(const Duration(seconds: 3), () {});
      final response = jsonDecode(jsonEncode({
        "user": {
          'id': 1,
          "name": 'User Name',
          "email": 'user@aa.aa',
          "email_verified_at": "2024-05-22 18:04:50",
          "created_at": "2024-05-22 18:04:50",
          "updated_at": "2024-05-22 18:04:50",
        }
      }));

      return response;
    });
  }

  @override
  Future<UserModel> getAuthUserDetail() async {
    return errorExceptionHandler(() async {
      // final response =
      //     await apiService.getReq(AuthApiEndpointConstants.getUserDetail);
      Future.delayed(const Duration(seconds: 3), () {});
      final response = jsonDecode(jsonEncode({
        'id': 1,
        "name": 'User Name',
        "email": 'user@aa.aa',
        "email_verified_at": "2024-05-22 18:04:50",
        "created_at": "2024-05-22 18:04:50",
        "updated_at": "2024-05-22 18:04:50",
      }));
      final user = UserModel.fromJson(response);
      return user;
    });
  }

  @override
  Future<Map<String, dynamic>> logout() {
    return errorExceptionHandler(() async {
      // final response =
      //     await apiService.postReq(AuthApiEndpointConstants.logout, {});
      Future.delayed(const Duration(seconds: 3), () {});
      final response = jsonDecode(jsonEncode({
        'message': "Logged out",
      }));
      return response;
    });
  }
}
