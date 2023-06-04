import 'package:lojahub/domain/errors/api_errors.dart';

class EitherResponse {
  Failure? failure;
  Object? response;

  bool isSuccess() {
    return response != null;
  }

  bool hasFailed() {
    return failure != null;
  }

  Object? getResponse() {
    return response;
  }

  Failure? getFailure() {
    return failure;
  }
}
