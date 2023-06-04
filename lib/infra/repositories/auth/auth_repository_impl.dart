import 'package:lojahub/domain/errors/api_errors.dart';
import 'package:either_dart/src/either.dart';
import 'package:lojahub/domain/repositories/auth_repository.dart';
import 'package:lojahub/domain/responses/either_response.dart';
import 'package:lojahub/infra/datasources/auth/auth_datasource.dart';
import 'package:lojahub/infra/helpers/http_helper.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource authDatasource;

  AuthRepositoryImpl(this.authDatasource);

  @override
  Future<Either<Failure, Object>> login(
      {required String email, required String password}) async {
    Either<Failure, Object> loginResponse =
        await authDatasource.login(email: email, password: password);
    /** @todo terminar de escopar o retorno default da implementação e implementar o login no external */

    return loginResponse;
  }
}
