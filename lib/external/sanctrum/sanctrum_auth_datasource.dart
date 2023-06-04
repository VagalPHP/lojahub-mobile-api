import 'package:lojahub/domain/config/app/app_config.dart';
import 'package:lojahub/domain/config/auth/auth_config.dart';
import 'package:lojahub/domain/errors/api_errors.dart';
import 'package:either_dart/src/either.dart';
import 'package:lojahub/infra/datasources/auth/auth_datasource.dart';
import 'package:lojahub/infra/helpers/http_helper.dart';

class SanctrumAuthDatasource implements AuthDatasource {
  late final HttpHelper httpHelper;
  final String apiEndpoint = AuthConfig().baseUrl;
  @override
  Future<Either<Failure, Object>> login(
      {required String email, required String password}) async {
    const String path = 'login';

    Object httpData = {email: email, password: password};

    httpHelper.get(url: apiEndpoint + path, data: httpData);

    if (httpHelper.hasExcepion()) {
      return Left(httpHelper.exceptionsInfos);
    }

    return Right(httpHelper.getData());
  }
}
