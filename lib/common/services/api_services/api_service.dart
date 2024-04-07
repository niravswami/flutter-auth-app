import 'dart:convert';

import 'package:dio/dio.dart';

import '../../constants/api_constants.dart';
import '../../utils/helpers/shared_preferences_helper_fn.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();

  late final Dio dio;

  factory ApiService() {
    return _instance;
  }

  ApiService._internal() {
    final options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
    );
    dio = Dio(options);
    _initializeInterceptors();
  }

  void _initializeInterceptors() {
    _addRequestInterceptor();
    _addResponseInterceptor();
    _addErrorInterceptor();
  }

  void _addRequestInterceptor() async {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.headers.addAll(await _getHeaders());
        return handler.next(options);
      },
    ));
  }

  Future<Map<String, dynamic>> _getHeaders() async {
    final accessToken = await SharedPreferencesHelper.getToken();
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
  }

  void _addResponseInterceptor() {
    dio.interceptors.add(InterceptorsWrapper(
      onResponse: (response, handler) {
        // Log response data, modify response, or handle response here
        return handler.next(response); // Pass the response down the chain
      },
    ));
  }

  void _addErrorInterceptor() {
    dio.interceptors.add(InterceptorsWrapper(
      onError: (DioException error, handler) {
        // Handle errors here, e.g., show toast, retry logic, etc.
        // Handle errors such as network errors, timeouts, etc.
        return handler.next(error); // Pass the error down the chain
      },
    ));
  }

  Future<Map<String, dynamic>> getReq(String endpoint) async {
    final response = await dio.get(
      endpoint,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> postReq(String endpoint, dynamic data) async {
    final response = await dio.post(
      endpoint,
      data: jsonEncode(data),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> putReq(String endpoint, dynamic data) async {
    final response = await dio.put(
      endpoint,
      data: jsonEncode(data),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> deleteReq(String endpoint) async {
    final response = await dio.delete(
      endpoint,
    );
    return response.data;
  }
}
