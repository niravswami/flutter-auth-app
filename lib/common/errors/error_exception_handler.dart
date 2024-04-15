import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import 'dio_exception_handling/dio_server_exception.dart';
import 'failure.dart';

Future<T> errorExceptionHandler<T>(Future<T> Function() action) async {
  try {
    return await action();
  } on DioException catch (e) {
    String message = 'An unexpected error occurred!';
    if (e.response != null) {
      message = e.response!.data['message'];
      throw DioServerException(
          statusCode: e.response!.statusCode,
          message: message,
          errors: e.response!.data['errors']);
    } else if (e.message != null) {
      message = e.message!;
    }
    throw DioServerException(message: message);
  } catch (e) {
    throw DioServerException(message: e.toString());
  }
}

Future<Either<Failure, T>> eitherErrorExceptionHandler<T>(
    Future<Either<Failure, T>> Function() action) async {
  try {
    return await action();
  } on DioServerException catch (e) {
    print("eitherErrorExceptionHandler");
    print(e.message);
    return left(Failure(
        message: e.message, errors: e.errors, statusCode: e.statusCode));
  }
}
