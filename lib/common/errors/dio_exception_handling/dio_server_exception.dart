final class DioServerException implements Exception {
  final int? statusCode;
  final String message;
  final Map<String, dynamic>? errors;

  const DioServerException({
    this.statusCode,
    required this.message,
    this.errors,
  });
}

final class DioServerException2 implements Exception {
  final String message;
  final Map<String, dynamic>? errors;
  final int? statusCode;

  const DioServerException2({
    required this.message,
    this.errors,
    this.statusCode,
  });
}
