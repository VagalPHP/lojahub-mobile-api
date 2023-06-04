class Failure implements Exception {}

class ApiError extends Failure {}

class EmptyData extends Failure {}

class ExceptionsInfos extends Failure {
  final String message;
  final int? statusCode;

  ExceptionsInfos({required this.message, this.statusCode});
}
