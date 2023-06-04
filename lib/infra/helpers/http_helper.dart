import 'package:dio/dio.dart';
import 'package:lojahub/domain/errors/api_errors.dart';

class HttpHelper {
  final Map<String, dynamic>? headers;
  late Response? response;
  late Object? data;
  Exception? exception;
  DioError? dioError;
  late ExceptionsInfos exceptionsInfos;

  HttpHelper({this.headers});

  dynamic getData() {
    return response!.data;
  }

  int getStatusCode() {
    return response!.statusCode ?? 500;
  }

  Response getResponse() {
    return response!;
  }

  Future<HttpHelper> get(
      {required String url,
      Object? data,
      Map<String, dynamic>? headers}) async {
    await dio(method: 'get', url: url, data: data, headers: headers);
    return this;
  }

  Future<HttpHelper> put(
      {required String url,
      Object? data,
      Map<String, dynamic>? headers}) async {
    await dio(method: 'put', url: url, data: data, headers: headers);
    return this;
  }

  Future<HttpHelper> post(
      {required String url,
      Object? data,
      Map<String, dynamic>? headers}) async {
    await dio(method: 'post', url: url, data: data, headers: headers);
    return this;
  }

  Future<HttpHelper> delete(
      {required String url,
      Object? data,
      Map<String, dynamic>? headers}) async {
    await dio(method: 'delete', url: url, data: data, headers: headers);
    return this;
  }

  Future<Response> dio(
      {String? method = 'get',
      required String url,
      Object? data,
      Map<String, dynamic>? headers}) async {
    final Dio dio =
        Dio(); // Instância base, para permitir manipulações nas demais funcionalidades do dio, sem ser pela forma de passagem de parâmetros via function

    dio.options.headers = this
        .headers; // Adiciona qualquer header criado durante a inicialização da Helper (que serão considerados base headers, ex: content-type: application/json)

    if (headers != null) {
      // Incrementa as opções de headers, vindas do argumento dos métodos http, aos headers base (do construtor)
      dio.options.headers.addAll(headers);
    }

    Map<String, Function> methods = {
      'get': () => dio.get(url, data: data),
      'put': () => dio.put(url, data: data),
      'post': () => dio.post(url, data: data),
      'delete': () => dio.delete(url, data: data),
    };

    try {
      response = await methods[method]?.call();
    } on DioError catch (e) {
      dioError = e;
    } on Exception catch (e) {
      exception = e;
    }

    return response!;
  }

  bool hasExcepion() {
    return dioError != null || exception != null;
  }

  ExceptionsInfos getExceptionMessage() {
    return ExceptionsInfos(
        message: dioError?.response?.data ?? 'Not mapped',
        statusCode: dioError?.response?.statusCode);
  }
}
