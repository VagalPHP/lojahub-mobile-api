import 'dart:core';

import 'package:lojahub/domain/config/app/app_config.dart';

class AuthConfig {
  final String baseUrl = "${AppConfig().getApiEndpoint()}/tokens/";
}
