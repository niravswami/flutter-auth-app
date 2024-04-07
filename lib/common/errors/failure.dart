// class Failure {
//   final String message;
//   Failure([this.message = 'An unexpected error occurred!']);
// }

class Failure {
  final String message;
  final Map<String, dynamic>? errors;
  final int? statusCode;

  Failure({
    this.errors,
    this.statusCode,
    this.message = 'An unexpected error occurred!',
  });
}
