import 'package:either_dart/either.dart';
import 'package:lojahub/domain/errors/api_errors.dart';

abstract class AuthRepository {
  Future<Either<Failure, Object>> login(
      {required String email, required String password});
}
